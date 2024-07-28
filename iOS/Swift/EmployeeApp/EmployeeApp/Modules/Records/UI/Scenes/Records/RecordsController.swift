//
//  RecordsController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit

class RecordsController: ViewController {
    var viewModel: RecordsViewModelProtocol!
    
    var onLogoutSuccess: VoidResult?
    var onNavigateToAddPost: VoidResult?
    var onNavigateToDetails: VoidResult?
    var onEditPost: VoidResult?
    
    @IBOutlet private(set) var navDrawerBGView: UIView!
    @IBOutlet private(set) var tableView: UITableView!
    @IBOutlet private(set) var navDrawerViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet private(set) var signoutButtonWidthConst: NSLayoutConstraint!
    
    private var isNavDrawerOpen: Bool = false
}

// MARK: - Lifecycle

extension RecordsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - Setup

private extension RecordsController {
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

private extension RecordsController {
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

private extension RecordsController {
    @IBAction
    func signoutButtonTapped() {
        showLoader()
        closeNavDrawer()
        
        delay(0.5) {
            // Note: - Added a little delay for loading animation
            self.viewModel.signoutUser(
                onSuccess: self.handleSignoutSuccess(),
                onError: self.handleError()
            )
        }
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
        onNavigateToAddPost?()
    }
}

// MARK: - Handlers

private extension RecordsController {
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
            self.onLogoutSuccess?()
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

// MARK: - UITableViewDelegate

extension RecordsController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        viewModel.cachePost(at: indexPath.row)
        onNavigateToDetails?()
    }
}

// MARK: - UITableViewDataSource

extension RecordsController: UITableViewDataSource {
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
        let delete = UIContextualAction(
            style: .destructive,
            title: S.delete()
        ) { [weak self] (action, sourceView, completionHandler) in
            guard let self else { return }
            self.showDeleteConfirmation(at: indexPath.row)
            completionHandler(true)
        }
        let edit = UIContextualAction(
            style: .normal,
            title: S.edit()
        ) { [weak self] (action, sourceView, completionHandler) in
            guard let self else { return }
            self.viewModel.cachePost(at: indexPath.row)
            self.onEditPost?()
            completionHandler(true)
        }
        let swipeAction = UISwipeActionsConfiguration(
            actions: [delete, edit]
        )
        swipeAction.performsFirstActionWithFullSwipe = false
        return swipeAction
    }
}
