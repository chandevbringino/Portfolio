//
//  AddOrEditEmplPersonalDetailsViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol AddOrEditEmployeePersonalDetailsViewModelProtocol {
    var firstname: String { get }
    var middlename: String? { get }
    var lastname: String { get }
    var gender: String { get }
    var birthday: String { get }
    
    func dateText(from date: Date) -> String
    
    var genderPickerVM: GenericPickerViewModelProtocol { get }
    
    func cacheEmployeeDetails(
        employeeParam: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func saveDetails(
        employeeParam: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
