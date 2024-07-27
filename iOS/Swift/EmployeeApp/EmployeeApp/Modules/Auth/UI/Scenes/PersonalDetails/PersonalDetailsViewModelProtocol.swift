//
//  PersonalDetailsViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol PersonalDetailsViewModelProtocol {
    var genderItems: [String] { get }
    
    var createAccountVM: CreateAccountViewModelProtocol? { get }
    
    func registerUser(
        userParams: UserParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
