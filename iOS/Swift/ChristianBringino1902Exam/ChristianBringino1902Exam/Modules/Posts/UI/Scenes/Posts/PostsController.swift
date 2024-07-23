//
//  PostsController.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit

class PostsController: ViewController {
    var viewModel: PostsViewModelProtocol!
    
    @IBOutlet private(set) var navDrawerBGView: UIView!
    @IBOutlet private(set) var tableView: UITableView!
    @IBOutlet private(set) var navDrawerViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet private(set) var signoutButtonWidthConst: NSLayoutConstraint!
    
    private var isNavDrawerOpen: Bool = false
}

// MARK: - Lifecycle

extension PostsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension PostsController {
    func setup() {
        setupNavBar()
        setupTableView()
        setupButton()
        setupNavDrawer()
        
        fetchPosts()
    }
    
    func setupNavBar() {
        title = "Posts"
        
        setupOpenNavDrawerButton()
        
        let rightButton = UIBarButtonItem(
            image: R.image.icAdd(),
            style: .plain,
            target: self,
            action: #selector(addPostTapped)
        )
        rightButton.tintColor = .black
        
        navigationItem.rightBarButtonItem = rightButton
    }
    
    func setupButton() {
        let buttonWidth = UIScreen.main.bounds.width / 1.48
        signoutButtonWidthConst.constant = buttonWidth
    }
    
    func setupOpenNavDrawerButton() {
        let leftButton = UIBarButtonItem(
            image: R.image.icListOptions(),
            style: .plain,
            target: self,
            action: #selector(burgerButtonTapped)
        )
        leftButton.tintColor = .black
        navigationItem.leftBarButtonItem = leftButton
    }
    
    func setupCloseNavDrawerButton() {
        let leftButton = UIBarButtonItem(
            image: R.image.icBack(),
            style: .plain,
            target: self,
            action: #selector(closeNavDrawerButtonTapped)
        )
        leftButton.tintColor = .black
        navigationItem.leftBarButtonItem = leftButton
    }
    
    func setupTableView() {
        tableView.register(R.nib.postTableCell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
    }
    
    func setupNavDrawer() {
        navDrawerViewWidthConstraint.constant = 0
        navDrawerBGView.backgroundColor = .clear
        navDrawerBGView.isHidden = true
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(closeNavDrawerButtonTapped)
        )
        
        navDrawerBGView.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Methods

private extension PostsController {
    func fetchPosts() {
        showLoader()
        viewModel.fetchPosts(
            onSuccess: handleFetchPostsSuccess(),
            onError: handleError()
        )
    }
    
    func openNavDrawer() {
        isNavDrawerOpen = true
        
        UIView.animate(withDuration: 0.3) {
            let navDrawerWidth = UIScreen.main.bounds.width / 1.3
            self.navDrawerViewWidthConstraint.constant = navDrawerWidth
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.navDrawerBGView.isHidden = false
            UIView.animate(withDuration: 0.2) {
                self.navDrawerBGView.backgroundColor = .black.withAlphaComponent(0.2)
                self.setupCloseNavDrawerButton()
            }
        }
    }
    
    func closeNavDrawer() {
        isNavDrawerOpen = false
        navDrawerBGView.backgroundColor = .clear
        navDrawerBGView.isHidden = true
        
        UIView.animate(withDuration: 0.3) {
            self.navDrawerViewWidthConstraint.constant = 0
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.setupOpenNavDrawerButton()
        }
    }
    
    func deletePost(at row: Int) {
        showLoader()
        viewModel.deletePost(
            at: row,
            onSuccess: handleDeletePostSuccess(),
            onError: handleError()
        )
    }
    
    func showDeleteConfirmation(at row: Int) {
        let alert = UIAlertController(
            title: "Delete",
            message: "Are you sure you want to delete this row?",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive) {_ in
            self.deletePost(at: row)
        })
        alert.addAction(UIAlertAction(title: "No", style: .cancel))
        present(alert, animated: true)
    }
}

// MARK: - Actions

private extension PostsController {
    @IBAction
    func signoutButtonTapped() {
        showLoader()
        closeNavDrawer()
        viewModel.signoutUser(
            onSuccess: handleSignoutSuccess(),
            onError: handleError()
        )
    }
    
    @objc
    func closeNavDrawerButtonTapped() {
        closeNavDrawer()
    }
    
    @objc
    func burgerButtonTapped() {
        openNavDrawer()
    }
    
    @objc
    func addPostTapped() {
        navigateToAddPostScene()
    }
}

// MARK: - Handlers

private extension PostsController {
    func handleFetchPostsSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.tableView.reloadData()
        }
    }
    
    func handleSignoutSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            self.setNewRoot()
        }
    }
    
    func handleDeletePostSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.fetchPosts()
        }
    }
}

// MARK: - Routers

private extension PostsController {
    func setNewRoot() {
        let vc = R.storyboard.login.loginController()!
        vc.viewModel = LoginViewModel()
        
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        
        self.view.window?.rootViewController = nc
        self.view.window?.makeKeyAndVisible()
    }
    
    func navigateToAddPostScene() {
        let vc = R.storyboard.addOrEditPost.addOrEditPostController()!
        vc.viewModel = viewModel.addPostVM
        vc.onSaveSuccess = {
            self.fetchPosts()
        }
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true)
    }
    
    func navigateToPostDetails(at row: Int) {
        let vc = R.storyboard.postDetails.postDetailsController()!
        vc.viewModel = viewModel.postDetailsVM(at: row)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToEditPostScene(at row: Int) {
        let vc = R.storyboard.addOrEditPost.addOrEditPostController()!
        vc.viewModel = viewModel.editPostVM(at: row)
        vc.onSaveSuccess = {
            self.fetchPosts()
        }
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true)
    }
}

// MARK: - UITableViewDelegate

extension PostsController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        navigateToPostDetails(at: indexPath.row)
    }
}

// MARK: - UITableViewDataSource

extension PostsController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.postsCount
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: R.nib.postTableCell.name,
            for: indexPath
        ) as? PostTableCell
        else {
            return PostTableCell()
        }
        
        cell.viewModel = viewModel.postCellVM(at: indexPath.row)
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            self.showDeleteConfirmation(at: indexPath.row)
            completionHandler(true)
        }
        let edit = UIContextualAction(style: .normal, title: "Edit") { (action, sourceView, completionHandler) in
            self.navigateToEditPostScene(at: indexPath.row)
            completionHandler(true)
        }
        let swipeAction = UISwipeActionsConfiguration(actions: [delete, edit])
        swipeAction.performsFirstActionWithFullSwipe = false
        return swipeAction
    }
}
