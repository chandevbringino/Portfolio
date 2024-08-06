//
//  
//  RandomUsersViewModel.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//
//
import Foundation

class RandomUsersViewModel: RandomUsersViewModelProtocol {
    private var paginator: DataPaginator<UserModel>
    
    private var randomUsers: [UserModel] = []
    
    private let service: RandomUserServiceProtocol
    private let networkService: NetworkMonitorServiceProtocol
    
    init(
        service: RandomUserServiceProtocol = App.shared.randomUser,
        networkService: NetworkMonitorServiceProtocol = App.shared.networkMonitor,
        paginator: DataPaginator<UserModel> = .init(defaultPageSize: Constants.defaultPageSize)
    ) {
        self.service = service
        self.networkService = networkService
        self.paginator = paginator
    }
}

// MARK: - Methods

extension RandomUsersViewModel {
    func clearFilter() {
        randomUsers = paginator.models
    }
    
    func filterUsers(with text: String) {
        let lowerCasedText = text.lowercased()
        let filteredUsers = paginator.models.filter(
            { ($0.name.first.lowercased() + " " + $0.name.last.lowercased()).contains(lowerCasedText) })
        randomUsers = filteredUsers
    }
    
    func reloadUsers(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        paginator.reset()
        
        guard networkService.isConnectedToInternet else {
            return fetchMoreUsers(
                onSuccess: onSuccess,
                onError: onError
            )
        }
        
        service.deleteRealmUsers(
            onSuccess: handleDeleteRealmUsersSuccess(
                thenExecute: onSuccess,
                onError: onError
            ),
            onError: onError
        )
    }
    
    func fetchMoreUsers(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if paginator.isFetching || paginator.hasLoadedAll {
            return
        }
        
        paginator.recordFetchAndIncrementPage()
        
        service.fetchRandomUsers(
            page: paginator.page,
            onSuccess: paginator.handleNewData(
                thenExecute: handleFetchUsersSuccess(thenExecute: onSuccess)
            ),
            onError: paginator.handleError(thenExecute: onError)
        )
    }
    
    func randomUserTableCellVM(at row: Int) -> RandomUserTableCellViewModelProtocol {
        RandomUserTableCellViewModel(user: randomUsers[row])
    }
    
    func randomUserDetailsVM(at row: Int) -> RandomUserDetailsViewModelProtocol {
        RandomUserDetailsViewModel(user: randomUsers[row])
    }
}

// MARK: - Handlers

private extension RandomUsersViewModel {
    func handleDeleteRealmUsersSuccess(
        thenExecute onCompletion: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.fetchMoreUsers(
                onSuccess: onCompletion,
                onError: onError
            )
        }
    }
    
    func handleFetchUsersSuccess(
        thenExecute onCompletion: @escaping VoidResult
    ) -> VoidResult {
        { [weak self] in
            guard let self else { return }
            
            self.randomUsers = paginator.models
            
            onCompletion()
        }
    }
}

// MARK: - Getters

extension RandomUsersViewModel {
    var usersCount: Int { randomUsers.count }
}
