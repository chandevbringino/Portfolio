//
//  
//  AddOrEditProfilePictureViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/31/24.
//
//
import Foundation

protocol AddOrEditProfilePictureViewModelProtocol {
    func createEmployee(
        employeeParam: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
