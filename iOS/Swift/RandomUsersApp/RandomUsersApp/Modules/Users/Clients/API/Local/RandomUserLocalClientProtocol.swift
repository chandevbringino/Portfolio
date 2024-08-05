//
//  RandomUserLocalClientProtocol.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/4/24.
//

import Foundation

protocol RandomUserLocalClientProtocol {
    func fetchUsers(
        page: Page,
        onSuccess: @escaping SingleResult<[UserModel]>,
        onError: @escaping ErrorResult
    )
    
    func saveUsers(
        _ users: [UserModel],
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func deleteRealmUsers(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
