//
//  
//  EmployeeCollectionCellViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/30/24.
//
//
import Foundation

class EmployeeCollectionCellViewModel: EmployeeCollectionCellViewModelProtocol {
    private let employee: EmployeeModel
    
    init(employee: EmployeeModel) {
        self.employee = employee
    }
}

// MARK: - Getters

extension EmployeeCollectionCellViewModel {
    var name: String { employee.firstName + " " + employee.lastName }
    var role: String { employee.role }
    var imageURL: URL? { URL(string: employee.imageURL ?? "") }
}
