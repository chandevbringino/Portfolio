//
//  SignupViewModelProtocol.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol SignupViewModelProtocol {
    var recordsVM: PostsViewModelProtocol { get }
    
    func registerUser(
        name: String,
        username: String,
        email: String,
        password: String,
        repeatPassword: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
