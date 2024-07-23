//
//  UserAPIProtocol.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol UserAPIProtocol: APIClientProtocol {
    func registerUser(
        userParams: UserParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func loginUser(
        username: String,
        password: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func logoutUser(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
