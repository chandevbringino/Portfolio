//
//  
//  AddOrEditProfessionalDetailsViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/31/24.
//
//
import Foundation

class AddOrEditProfessionalDetailsViewModel: AddOrEditProfessionalDetailsViewModelProtocol {
    var onCacheEmployee: SingleResult<EmployeeParams>?
    
    private var params: EmployeeParams
    private var employee: EmployeeModel?
    
    private var _isCurrentEmployee: Bool = false
    
    private let service: EmployeesServiceProtocol
    
    init(
        service: EmployeesServiceProtocol,
        params: EmployeeParams,
        employee: EmployeeModel? = nil
    ) {
        self.params = params
        self.service = service
        self.employee = employee
    }
}

// MARK: - Methods

extension AddOrEditProfessionalDetailsViewModel {
    func toggleIsCurrentEmployee() {
        _isCurrentEmployee.toggle()
    }
    
    func cacheEmployeeDetails(
        employeeParam: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if let error = validate(params: employeeParam) {
            return onError(error)
        }
        
        params.email = employeeParam.email
        params.phoneNumber = employeeParam.phoneNumber
        params.role = employeeParam.role
        params.startDate = employeeParam.startDate
        params.endDate = employeeParam.endDate
        params.reasonForLeaving = employeeParam.reasonForLeaving
        
        onCacheEmployee?(params)
        onSuccess()
    }
    
    // TODO: - For improvement. Must be "unit" testable
    func validate(params: EmployeeParams) -> Error? {
        if (params.email ?? "").isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Email")
        } else if (params.phoneNumber ?? "").isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Phone number")
        } else if (params.role ?? "").isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Role")
        } else if params.startDate == nil {
            return AppError.mustNotBeEmpty(fieldName: "Start date")
        } else if !isCurrentEmployee && params.endDate == nil {
            return AppError.mustNotBeEmpty(fieldName: "End date")
        }
        
        return nil
    }
    
    func dateText(from date: Date) -> String {
        let formatter = Constants.Formatters.birthdateFormatter
        return formatter.string(from: date)
    }
}

// MARK: - Getters

extension AddOrEditProfessionalDetailsViewModel {
    var email: String { employee?.email ?? "" }
    var phoneNumber: String { employee?.phoneNumber ?? "" }
    var role: String { employee?.role ?? "" }
    var startDateText: String {
        guard let employee else { return "" }
        let formatter = Constants.Formatters.birthdateFormatter
        return formatter.string(from: employee.startDate)
    }
    var endDateText: String {
        guard let endDate = employee?.endDate else { return "" }
        let formatter = Constants.Formatters.birthdateFormatter
        return formatter.string(from: endDate)
    }
    var reasonForLeaving: String { employee?.reasonForLeaving ?? "" }
    
    var isCurrentEmployee: Bool { _isCurrentEmployee }
}
