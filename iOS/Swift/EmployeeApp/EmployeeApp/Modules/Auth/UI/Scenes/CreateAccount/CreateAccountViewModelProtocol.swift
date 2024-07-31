//
//  CreateAccountViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/27/24.
//

import Foundation

protocol CreateAccountViewModelProtocol {
    var recordsVM: EmployeesViewModelProtocol { get }
    
    func registerUser(
        userParams: UserParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
