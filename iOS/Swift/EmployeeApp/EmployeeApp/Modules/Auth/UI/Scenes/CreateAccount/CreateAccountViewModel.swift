//
//  CreateAccountViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/27/24.
//

import Foundation

class CreateAccountViewModel: CreateAccountViewModelProtocol {
    private var userParams: UserParams
    
    private let service: AuthServiceProtocol
    
    init(
        service: AuthServiceProtocol = App.shared.auth,
        userParams: UserParams
    ) {
        self.service = service
        self.userParams = userParams
    }
}

// MARK: - Methods

extension CreateAccountViewModel {
    func registerUser(
        userParams: UserParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if let error = validate(userParams: userParams) {
            return onError(error)
        }
        
        // TODO: - To be improved
        self.userParams.role = userParams.role
        self.userParams.phoneNumber = userParams.phoneNumber
        self.userParams.email = userParams.email
        self.userParams.password = userParams.password
        
        service.registerUser(
            param: self.userParams,
            onSuccess: handleRegisterUserSuccess(thenExecute: onSuccess),
            onError: onError
        )
    }
    
    // TODO: - For improvement. Must be "unit" testable
    func validate(userParams: UserParams) -> Error? {
        if userParams.role.isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Role")
        } else if (userParams.phoneNumber ?? "").isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Phone number")
        } else if (userParams.email ?? "").isEmpty {
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

private extension CreateAccountViewModel {
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

extension CreateAccountViewModel {
    var recordsVM: RecordsViewModelProtocol { RecordsViewModel() }
}
