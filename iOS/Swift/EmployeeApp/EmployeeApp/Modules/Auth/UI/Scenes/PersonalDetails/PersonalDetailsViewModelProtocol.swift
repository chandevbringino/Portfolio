//
//  PersonalDetailsViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol PersonalDetailsViewModelProtocol {
    var genderItems: [Gender] { get }
    
    var createAccountVM: CreateAccountViewModelProtocol? { get }
    var genderPickerVM: GenericPickerViewModelProtocol { get }
    
    func dateText(from date: Date) -> String
    
    func registerUser(
        userParams: UserParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
