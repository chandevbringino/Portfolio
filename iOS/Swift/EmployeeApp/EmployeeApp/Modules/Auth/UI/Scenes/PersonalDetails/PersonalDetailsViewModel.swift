//
//  PersonalDetailsViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class PersonalDetailsViewModel: PersonalDetailsViewModelProtocol {
    var onCacheUserParams: SingleResult<UserParams>?
    
    private let genders: [Gender] = [.male, .female, .other]
}

// MARK: - Methods

extension PersonalDetailsViewModel {
    func cacheUserParams(
        userParams: UserParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if let error = validate(userParams: userParams) {
            return onError(error)
        }
        
        onCacheUserParams?(userParams)
        onSuccess()
    }
    
    // TODO: - For improvement. Must be "unit" testable
    func validate(userParams: UserParams) -> Error? {
        if (userParams.firstName ?? "").isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "First name")
        } else if (userParams.lastName ?? "").isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Last name")
        } else if userParams.gender == nil {
            return AppError.mustNotBeEmpty(fieldName: "Gender")
        } else if userParams.birthdate == nil {
            return AppError.mustNotBeEmpty(fieldName: "Birthday")
        }
        
        return nil
    }
    
    func dateText(from date: Date) -> String {
        let formatter = Constants.Formatters.birthdateFormatter
        return formatter.string(from: date)
    }
}

// MARK: - Getters

extension PersonalDetailsViewModel {
    var genderItems: [Gender] { genders }
    
    var genderPickerVM: GenericPickerViewModelProtocol {
        GenericPickerViewModel(
            options: genders.map({ $0.rawValue })
        )
    }
}
