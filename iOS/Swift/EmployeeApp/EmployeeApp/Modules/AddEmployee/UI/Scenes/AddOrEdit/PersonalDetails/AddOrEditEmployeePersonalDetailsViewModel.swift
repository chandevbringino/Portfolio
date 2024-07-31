//
//  AddOrEditEmployeePersonalDetailsViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class AddOrEditEmployeePersonalDetailsViewModel: AddOrEditEmployeePersonalDetailsViewModelProtocol {
    var onCacheEmployee: SingleResult<EmployeeParams>?
    
    private let service: EmployeesServiceProtocol
    private let employee: EmployeeModel?
    
    private let genders: [Gender] = [.male, .female, .other]
    
    init(
        service: EmployeesServiceProtocol,
        employee: EmployeeModel? = nil
    ) {
        self.service = service
        self.employee = employee
    }
}

// MARK: - Methods

extension AddOrEditEmployeePersonalDetailsViewModel {
    func saveDetails(
        employeeParam: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if let error = validate(params: employeeParam) {
            return onError(error)
        }
        
        // TODO: - Update employee details in DB
    }
    
    func cacheEmployeeDetails(
        employeeParam: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if let error = validate(params: employeeParam) {
            return onError(error)
        }
        
        onCacheEmployee?(employeeParam)
        onSuccess()
    }
    
    // TODO: - For improvement. Must be "unit" testable
    func validate(params: EmployeeParams) -> Error? {
        if (params.firstname ?? "").isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "First name")
        } else if (params.lastname ?? "").isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Last name")
        } else if params.gender == nil {
            return AppError.mustNotBeEmpty(fieldName: "Gender")
        } else if params.birthdate == nil {
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

extension AddOrEditEmployeePersonalDetailsViewModel {
    var firstname: String { employee?.firstName ?? "" }
    var middlename: String? { employee?.middleName }
    var lastname: String { employee?.lastName ?? "" }
    var gender: String { employee?.gender.rawValue ?? "" }
    var birthday: String {
        guard let employee else { return "" }
        let formatter = Constants.Formatters.birthdateFormatter
        return formatter.string(from: employee.birthDate)
    }
    
    var genderPickerVM: GenericPickerViewModelProtocol {
        GenericPickerViewModel(
            options: genders.map({ $0.rawValue })
        )
    }
}
