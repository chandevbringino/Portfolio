//
//  PersonalDetailsViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol PersonalDetailsViewModelProtocol {
    var genderItems: [Gender] { get }
    
    var genderPickerVM: GenericPickerViewModelProtocol { get }
    
    func dateText(from date: Date) -> String
    
    func cacheUserParams(
        userParams: UserParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
