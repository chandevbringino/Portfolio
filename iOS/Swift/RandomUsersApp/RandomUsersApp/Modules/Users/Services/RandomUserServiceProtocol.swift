//
//  
//  RandomUserServiceProtocol.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//
//
import Foundation

protocol RandomUserServiceProtocol {
    func fetchRandomUsers(
        page: Page,
        onSuccess: @escaping SingleResult<[UserModel]>,
        onError: @escaping ErrorResult
    )
    
    func deleteRealmUsers(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
