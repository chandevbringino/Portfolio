//
//  EmployeesServiceProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

protocol EmployeesServiceProtocol {
    func getEmployees(
        onSuccess: @escaping SingleResult<[EmployeeModel]>,
        onError: @escaping ErrorResult
    )
}
