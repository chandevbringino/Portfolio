//
//  AuthService.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/26/24.
//

import Foundation
import FirebaseAuth

class AuthService: AuthServiceProtocol {
}

// MARK: - Methods

extension AuthService {
    func signInUser(
        email: String,
        password: String,
        onSuccess: @escaping SingleResult<UserModel>,
        onError: @escaping ErrorResult
    ) {
        Auth.auth().signIn(
            withEmail: email,
            password: password
        ) { dataResult, error in
            if let error {
                return onError(error)
            }
            
            guard let user = dataResult?.user else {
                return onError(AppError.dataNotFound)
            }
            
            let userModel = UserModel(from: user)
            onSuccess(userModel)
        }
    }
    
    func registerUser(
        param: UserParams,
        onSuccess: @escaping SingleResult<UserModel>,
        onError: @escaping ErrorResult
    ) {
        Auth.auth().createUser(
            withEmail: param.email,
            password: param.password
        ) { dataResult, error in
            if let error {
                return onError(error)
            }
            
            guard let user = dataResult?.user else {
                return onError(AppError.dataNotFound)
            }
            let userModel = UserModel(from: user)
            onSuccess(userModel)
        }
    }
    
    func signoutUser(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        do {
            try Auth.auth().signOut()
            onSuccess()
        } catch let error {
            onError(error)
        }
    }
}
