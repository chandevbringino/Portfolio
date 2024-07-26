//
//  SignupViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class SignupViewModel: SignupViewModelProtocol {
    private let service: AuthServiceProtocol
    
    init(
        service: AuthServiceProtocol = App.shared.auth
    ) {
        self.service = service
    }
}

// MARK: - Methods

extension SignupViewModel {
    func registerUser(
        name: String,
        phoneNumber: String,
        email: String,
        password: String,
        repeatPassword: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        let userParams = UserParams(
            name: name,
            phoneNumber: phoneNumber,
            email: email,
            password: password,
            repeatPassword: repeatPassword
        )
        
        if let error = validate(userParams: userParams) {
            return onError(error)
        }
        
        service.registerUser(
            param: userParams,
            onSuccess: handleRegisterUserSuccess(thenExecute: onSuccess),
            onError: onError
        )
    }
    
    // TODO: - For improvement. Must be "unit" testable
    func validate(userParams: UserParams) -> Error? {
        if userParams.name.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Full name")
        } else if userParams.phoneNumber.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Phone number")
        } else if userParams.email.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Email")
        } else if userParams.password.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Password")
        } else if userParams.repeatPassword.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Repeat Password")
        } else if userParams.password != userParams.repeatPassword {
            return AppError.passwordAndRepeatPasswordNotMatched
        }
        
        return nil
    }
}

// MARK: - Handlers

private extension SignupViewModel {
    func handleRegisterUserSuccess(
        thenExecute onCompletion: @escaping VoidResult
    ) -> SingleResult<UserModel> {
        { [weak self] _ in
            guard let self else { return }
            // TODO: - persist user data in realmswift
            onCompletion()
        }
    }
}

// MARK: - Getters

extension SignupViewModel {
    var recordsVM: PostsViewModelProtocol { PostsViewModel() }
}
