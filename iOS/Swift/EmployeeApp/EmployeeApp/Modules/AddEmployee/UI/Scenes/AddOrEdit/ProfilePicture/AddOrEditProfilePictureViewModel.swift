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
    private var imageData: Data?
    
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
        imageData = data
    }
    
    func createEmployee(
        employeeParam: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        
    }
}

// MARK: - Getters

extension AddOrEditProfilePictureViewModel {
    var imageURL: URL? { URL(string: employee?.imageURL ?? "") }
}
