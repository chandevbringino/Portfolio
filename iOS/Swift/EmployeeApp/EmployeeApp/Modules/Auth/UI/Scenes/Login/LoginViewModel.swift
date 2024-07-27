//
//  LoginViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class LoginViewModel: LoginViewModelProtocol {
    private let service: AuthServiceProtocol
    
    init(
        service: AuthServiceProtocol = App.shared.auth
    ) {
        self.service = service
    }
}

// MARK: - Methods

extension LoginViewModel {
    func loginUser(
        email: String,
        password: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if let error = validate(
            email: email,
            password: password
        ) {
            return onError(error)
        }
        
        service.signInUser(
            email: email,
            password: password,
            onSuccess: handleLoginSuccess(thenExecute: onSuccess),
            onError: onError
        )
    }
    
    func validate(email: String, password: String) -> Error? {
        if email.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Email")
        } else if password.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Password")
        }
        
        return nil
    }
}

// MARK: - Handlers

private extension LoginViewModel {
    func handleLoginSuccess(
        thenExecute onCompletion: @escaping VoidResult
    ) -> SingleResult<UserModel> {
        { [weak self] user in
            guard let self else { return }
            // TODO: - persist user data with RealmSwift
            onCompletion()
        }
    }
}

// MARK: - Getters

extension LoginViewModel {
    var signupVM: PersonalDetailsViewModelProtocol { PersonalDetailsViewModel() }
    var postsVM: PostsViewModelProtocol { PostsViewModel() }
}
