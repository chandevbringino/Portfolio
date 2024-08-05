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
    private var isFetching: Bool = false
    private var hasLoadedAll: Bool = false
    private var page: Int = 0
    
    private var baseRandomUsers: [UserModel] = []
    private var randomUsers: [UserModel] = []
    
    private let size: Int = 10
    private let service: RandomUserServiceProtocol
    private let networkService: NetworkMonitorServiceProtocol
    
    init(
        service: RandomUserServiceProtocol = App.shared.randomUser,
        networkService: NetworkMonitorServiceProtocol = App.shared.networkMonitor
    ) {
        self.service = service
        self.networkService = networkService
    }
}

// MARK: - Helpers

private extension RandomUsersViewModel {
    private func reset() {
        isFetching = false
        hasLoadedAll = false
        page = 0
    }
}

// MARK: - Methods

extension RandomUsersViewModel {
    func clearFilter() {
        randomUsers = baseRandomUsers
    }
    
    func filterUsers(with text: String) {
        let lowerCasedText = text.lowercased()
        let filteredUsers = baseRandomUsers.filter(
            { ($0.name.first.lowercased() + " " + $0.name.last.lowercased()).contains(lowerCasedText) })
        randomUsers = filteredUsers
    }
    
    func reloadUsers(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        reset()
        
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
        // TODO: - Improve pagination in future. Move logic to another class.
        if isFetching || hasLoadedAll {
            return
        }
        
        page += 1
        isFetching = true
        
        let page = Page(
            size: size,
            page: page
        )
        
        service.fetchRandomUsers(
            page: page,
            onSuccess: handleFetchUsersSuccess(
                thenExecute: onSuccess
            ),
            onError: handleError(thenExecute: onError)
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
    ) -> SingleResult<[UserModel]> {
        { [weak self] users in
            guard let self else { return }
            
            if self.page == 1 {
                self.baseRandomUsers = []
            }
            
            if users.count < self.size {
                hasLoadedAll = true
            }
            
            self.baseRandomUsers.append(contentsOf: users)
            self.randomUsers = baseRandomUsers
            
            self.isFetching = false
            onCompletion()
        }
    }
    
    func handleError(
        thenExecute onError: @escaping ErrorResult
    ) -> ErrorResult {
        { [weak self] error in
            guard let self else { return }
            self.isFetching = false
            self.page = 0
            onError(error)
        }
    }
}

// MARK: - Getters

extension RandomUsersViewModel {
    var usersCount: Int { randomUsers.count }
}
