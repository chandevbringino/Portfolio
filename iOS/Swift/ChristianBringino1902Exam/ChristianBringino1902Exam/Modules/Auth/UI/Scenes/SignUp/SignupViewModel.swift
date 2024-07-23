//
//  SignupViewModel.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class SignupViewModel: SignupViewModelProtocol {
    private let userAPI: UserAPIProtocol
    
    init(
        userAPI: UserAPIProtocol = App.shared.userAPI
    ) {
        self.userAPI = userAPI
    }
}

// MARK: - Methods

extension SignupViewModel {
    func registerUser(
        name: String,
        username: String,
        email: String,
        password: String,
        repeatPassword: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if username.isEmpty {
            return onError(AppError.mustNotBeEmpty(fieldName: "Username"))
        } else if name.isEmpty {
            return onError(AppError.mustNotBeEmpty(fieldName: "Full Name"))
        } else if email.isEmpty {
            return onError(AppError.mustNotBeEmpty(fieldName: "Email"))
        } else if password.isEmpty {
            return onError(AppError.mustNotBeEmpty(fieldName: "Password"))
        } else if repeatPassword.isEmpty {
            return onError(AppError.mustNotBeEmpty(fieldName: "Repeat Password"))
        }
        
        if password != repeatPassword {
            return onError(AppError.passwordAndRepeatPasswordNotMatched)
        }
        
        let userParams = UserParams(
            username: username,
            email: email,
            name: name,
            password: password
        )
        
        userAPI.registerUser(
            userParams: userParams,
            onSuccess: onSuccess,
            onError: onError
        )
    }
}

// MARK: - Getters

extension SignupViewModel {
    var recordsVM: PostsViewModelProtocol { PostsViewModel() }
}
