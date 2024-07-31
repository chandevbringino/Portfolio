//
//  AuthServiceProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/26/24.
//

import Foundation

protocol AuthServiceProtocol {
    func signInUser(
        email: String,
        password: String,
        onSuccess: @escaping SingleResult<UserModel>,
        onError: @escaping ErrorResult
    )
    
    func registerUser(
        param: UserParams,
        onSuccess: @escaping SingleResult<UserModel>,
        onError: @escaping ErrorResult
    )
    
    func signoutUser(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
