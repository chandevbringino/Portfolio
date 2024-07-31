//
//  
//  AddOrEditProfessionalDetailsViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/31/24.
//
//
import Foundation

protocol AddOrEditProfessionalDetailsViewModelProtocol {
    var email: String { get }
    var phoneNumber: String { get }
    var role: String { get }
    var startDateText: String { get }
    var endDateText: String { get }
    var reasonForLeaving: String { get }
    
    func dateText(from date: Date) -> String
    
    func cacheEmployeeDetails(
        employeeParam: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
