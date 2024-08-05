//
//  
//  RandomUserService.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//
//
import Foundation

class RandomUserService: RandomUserServiceProtocol {
    private let api: RandomUserAPI
    private let networkService: NetworkMonitorServiceProtocol
    private let localClient: RandomUserLocalClientProtocol
    
    init(
        api: RandomUserAPI,
        localClient: RandomUserLocalClientProtocol,
        networkService: NetworkMonitorServiceProtocol = App.shared.networkMonitor
    ) {
        self.api = api
        self.localClient = localClient
        self.networkService = networkService
    }
}

// MARK: - Methods

extension RandomUserService {
    func fetchRandomUsers(
        page: Page,
        onSuccess: @escaping SingleResult<[UserModel]>,
        onError: @escaping ErrorResult
    ) {
        guard networkService.isConnectedToInternet else {
            return localClient.fetchUsers(
                page: page,
                onSuccess: onSuccess,
                onError: onError
            )
        }
        
        guard page.page <= Constants.maxLocalPage else {
            return api.fetchRandomUsers(
                page: page,
                onSuccess: onSuccess,
                onError: onError
            )
        }
        
        localClient.fetchUsers(
            page: page,
            onSuccess: { [unowned self] users in
                if users.isEmpty {
                    self.fetchFromRemoteThenSavetoLocal(
                        page: page,
                        onSuccess: onSuccess,
                        onError: onError
                    )
                } else { onSuccess(users) }
            },
            onError: onError
        )
    }
    
    private func fetchFromRemoteThenSavetoLocal(
        page: Page,
        onSuccess: @escaping SingleResult<[UserModel]>,
        onError: @escaping ErrorResult
    ) {
        api.fetchRandomUsers(
            page: page,
            onSuccess: { [unowned self] users in
                onSuccess(users)
                
                self.localClient.saveUsers(
                    users,
                    onSuccess: DefaultClosure.voidResult(),
                    onError: handleError()
                )
            },
            onError: onError
        )
    }
    
    func deleteRealmUsers(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        localClient.deleteRealmUsers(
            onSuccess: onSuccess,
            onError: onError
        )
    }
}

// MARK: - Handlers

private extension RandomUserService {
    func handleError() -> ErrorResult {
        { error in
            print("Local DB Error: \(error.localizedDescription)")
        }
    }
}
