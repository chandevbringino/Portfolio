//
//  EmployeesController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit

class EmployeesController: ViewController {
    var viewModel: EmployeesViewModelProtocol!
    
    var onLogoutSuccess: VoidResult?
    var onNavigateToAddEmployee: VoidResult?
    var onNavigateToDetails: VoidResult?
    
    @IBOutlet private(set) var navDrawerBGView: UIView!
    @IBOutlet private(set) var collectionView: UICollectionView!
    @IBOutlet private(set) var navDrawerViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet private(set) var signoutButtonWidthConst: NSLayoutConstraint!
    @IBOutlet private(set) var searchBar: UISearchBar!
    
    private var isNavDrawerOpen: Bool = false
}

// MARK: - Lifecycle

extension EmployeesController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

// MARK: - Setup

private extension EmployeesController {
    func setup() {
        setupNavBar()
        setupSearchbar()
        setupRefresher()
        setupCollectionView()
        setupButton()
        setupNavDrawer()
        
        fetchEmployees()
    }
    
    func setupNavBar() {
        title = S.employeesTitle()
        
        setupOpenNavDrawerButton()
        
        let rightButton = UIBarButtonItem(
            image: R.image.icAdd(),
            style: .plain,
            target: self,
            action: #selector(addEmployeeTapped)
        )
        rightButton.tintColor = .black
        
        navigationItem.rightBarButtonItem = rightButton
    }
    
    func setupSearchbar() {
        searchBar.delegate = self
    }
    
    func setupRefresher() {
        let refresher = UIRefreshControl()
        refresher.addTarget(self,
            action: #selector(pullToRefersh),
            for: .valueChanged
        )
        collectionView.refreshControl = refresher
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
    
    func setupCollectionView() {
        collectionView.register(R.nib.employeeCollectionCell)
        collectionView.delegate = self
        collectionView.dataSource = self
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

private extension EmployeesController {
    func fetchEmployees(isPullToRefresh: Bool = false) {
        if !isPullToRefresh {
            showLoader()
        }
        
        viewModel.fetchEmployees(
            onSuccess: handleFetchEmployeesSuccess(),
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
}

// MARK: - Actions

private extension EmployeesController {
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
    func pullToRefersh() {
        fetchEmployees(isPullToRefresh: true)
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
    func addEmployeeTapped() {
        onNavigateToAddEmployee?()
    }
}

// MARK: - Handlers

private extension EmployeesController {
    func handleFetchEmployeesSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.collectionView.refreshControl?.endRefreshing()
            self.collectionView.reloadData()
        }
    }
    
    func handleSignoutSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.onLogoutSuccess?()
        }
    }
}

// MARK: - UISearchBarDelegate

extension EmployeesController: UISearchBarDelegate {
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String
    ) {
        if searchText.count > 2 {
            viewModel.filterEmployees(
                with: searchText
            )
        } else if searchText.isEmpty {
            viewModel.clearFilter()
        }
        
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate

extension EmployeesController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        viewModel.cacheEmployee(at: indexPath.row)
        onNavigateToDetails?()
    }
}

// MARK: - UICollectionViewDataSource

extension EmployeesController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        viewModel.employeesCount
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.nib.employeeCollectionCell.identifier,
            for: indexPath
        ) as? EmployeeCollectionCell
        else { return EmployeeCollectionCell() }
        
        cell.viewModel = viewModel.employeeCellVM(at: indexPath.row)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension EmployeesController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (collectionView.frame.width / 2) - 13
        return CGSize(width: width, height: 265)
    }
}
