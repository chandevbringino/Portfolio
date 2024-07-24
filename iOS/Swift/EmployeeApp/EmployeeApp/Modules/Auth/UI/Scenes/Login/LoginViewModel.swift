//
//  LoginViewModel.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    private let userAPI: UserAPIProtocol
    
    init(
        userAPI: UserAPIProtocol = App.shared.userAPI
    ) {
        self.userAPI = userAPI
    }
}

// MARK: - Methods

extension LoginViewModel {
    func loginUser(
        username: String,
        password: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if username.isEmpty {
            return onError(AppError.mustNotBeEmpty(fieldName: "Username"))
        } else if password.isEmpty {
            return onError(AppError.mustNotBeEmpty(fieldName: "Password"))
        }
        
        userAPI.loginUser(
            username: username,
            password: password,
            onSuccess: onSuccess,
            onError: onError
        )
    }
}

// MARK: - Getters

extension LoginViewModel {
    var signupVM: SignupViewModelProtocol { SignupViewModel() }
    var postsVM: PostsViewModelProtocol { PostsViewModel() }
}
