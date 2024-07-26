//
//  UserParams.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import Alamofire

struct UserParams {
    let firstName: String
    let middleName: String?
    let lastName: String
    let phoneNumber: String
    let gender: Gender?
    let birthdate: Date?
    let email: String
    let role: String
    let password: String
    let repeatPassword: String
}

extension UserParams {
    var params: Parameters {
        var params = Parameters()
        // TODO: - Remove this and apply codable protocol
        params["phoneNumber"] = phoneNumber
        params["password"] = password
        params["email"] = email
        
        return params
    }
}
