//
//  LoginViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol LoginViewModelProtocol {
    var signupVM: SignupViewModelProtocol { get }
    var postsVM: PostsViewModelProtocol { get }
    
    func loginUser(
        email: String,
        password: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
