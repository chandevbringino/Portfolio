//
//  SignupViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol SignupViewModelProtocol {
    var recordsVM: PostsViewModelProtocol { get }
    
    func registerUser(
        userParams: UserParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
