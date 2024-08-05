//
//  
//  RandomUsersController.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class RandomUsersController: ViewController {
    var viewModel: RandomUsersViewModelProtocol!
    
    @IBOutlet private(set) var tableView: UITableView!
    @IBOutlet private(set) var searchBar: UISearchBar!
    
    private var isSearching: Bool = false
    
    private let bag = DisposeBag()
}

// MARK: - Lifecycle

extension RandomUsersController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bind()
    }
}

// MARK: - Bind

private extension RandomUsersController {
    func bind() {
        searchBar.searchTextField.rx
            .controlEvent([.editingChanged])
            .asObservable()
            .subscribe { [weak self] _ in
                guard 
                    let self,
                    let text = self.searchBar.text
                else { return }
                if text.isEmpty {
                    self.viewModel.clearFilter()
                    self.isSearching = false
                } else {
                    self.viewModel.filterUsers(with: text)
                    self.isSearching = true
                }
                
                self.tableView.reloadData()
            }
            .disposed(by: bag)
        
        searchBar.rx
            .searchButtonClicked
            .asDriver()
            .drive(onNext: { _ in
                self.searchBar.resignFirstResponder()
            })
            .disposed(by: bag)
    }
}

// MARK: - Setup

private extension RandomUsersController {
    func setup() {
        setupTableView()
        setupRefresher()
        
        // Note: Adding delay to let network service start to get accurate network status.
        delay(0.5) {
            self.fetchMore()
        }
    }
    
    func setupTableView() {
        tableView.register(R.nib.randomUserTableCell)
        tableView.rowHeight = 80
        tableView.dataSource = self
        tableView.delegate = self
        tableView.accessibilityIdentifier = "myTableview"
    }
    
    func setupRefresher() {
        let refresher = UIRefreshControl()
        refresher.addTarget(self,
            action: #selector(pullToRefresh),
            for: .valueChanged
        )
        tableView.refreshControl = refresher
    }
}

// MARK: - Methods

private extension RandomUsersController {
    func fetchMore(isShowLoader: Bool = true) {
        if isShowLoader {
            showLoader()
        }
        
        viewModel.fetchMoreUsers(
            onSuccess: handleFetchUsersSuccess(),
            onError: handleError()
        )
    }
    
    func reloadUsers(isPullRefresh: Bool = false) {
        if !isPullRefresh {
            showLoader()
        }
        
        viewModel.reloadUsers(
            onSuccess: handleFetchUsersSuccess(),
            onError: handleError(tableView: tableView)
        )
    }
}

// MARK: - Handlers

private extension RandomUsersController {
    func handleFetchUsersSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    func handleSetTitle() -> SingleResult<String> {
        { [weak self] title in
            guard let self else { return }
            self.title = title
        }
    }
}

// MARK: - Actions

private extension RandomUsersController {
    @objc
    func pullToRefresh() {
        reloadUsers(isPullRefresh: true)
    }
}

// MARK: - Routers

private extension RandomUsersController {
    func navigateToRandomUserDetails(at row: Int) {
        let vc = R.storyboard.randomUserDetails.randomUserDetailsController()!
        vc.viewModel = viewModel.randomUserDetailsVM(at: row)
        vc.onSetTitle = handleSetTitle()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDelegate

extension RandomUsersController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        navigateToRandomUserDetails(at: indexPath.row)
    }
}

// MARK: - UITableViewDataSource

extension RandomUsersController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.usersCount
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: R.nib.randomUserTableCell.identifier,
            for: indexPath
        ) as? RandomUserTableCell
        else { return RandomUserTableCell() }
        
        cell.viewModel = viewModel.randomUserTableCellVM(at: indexPath.row)
        cell.accessibilityIdentifier = "myCell_\(indexPath.row)"
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        if isSearching { return }
        
        if indexPath.row > viewModel.usersCount - 3 {
            fetchMore(isShowLoader: false)
        }
    }
}
