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
        userParams: UserParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
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
        if userParams.firstName.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "First name")
        } else if (userParams.middleName ?? "").isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Middle name")
        } else if userParams.lastName.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Last name")
        } else if userParams.phoneNumber.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Phone number")
        } else if userParams.gender == nil {
            return AppError.mustNotBeEmpty(fieldName: "Gender")
        } else if userParams.birthdate == nil {
            return AppError.mustNotBeEmpty(fieldName: "Birthday")
        } else if userParams.role.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Role")
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
