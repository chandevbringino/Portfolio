//
//  
//  AddOrEditProfilePictureViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/31/24.
//
//
import Foundation

class AddOrEditProfilePictureViewModel: AddOrEditProfilePictureViewModelProtocol {
    private var params: EmployeeParams
    private var employee: EmployeeModel?
    
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

extension AddOrEditProfilePictureViewModel {
    func setImage(data: Data) {
        params.imageData = data
    }
    
    func createEmployee(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if let error = validate(params: params) {
            return onError(error)
        }
        
        service.createEmployee(
            param: params,
            onSuccess: onSuccess,
            onError: onError
        )
    }
    
    // TODO: - For improvement. Must be "unit" testable
    func validate(params: EmployeeParams) -> Error? {
        if params.imageData == nil {
            return AppError.mustNotBeEmpty(fieldName: "Profile Picture")
        }
        
        return nil
    }
}

// MARK: - Getters

extension AddOrEditProfilePictureViewModel {
    var imageURL: URL? { URL(string: employee?.imageURL ?? "") }
}
