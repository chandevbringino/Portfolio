//
//  EmployeesViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol EmployeesViewModelProtocol {
    var employeesCount: Int { get }
    
    var addPostVM: AddOrEditEmployeeViewModelProtocol { get }
    
    func cacheEmployee(at row: Int)
    
    func employeeCellVM(at row: Int) -> EmployeeCollectionCellViewModelProtocol
     
    func fetchEmployees(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func signoutUser(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
