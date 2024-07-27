//
//  UserParams.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import Alamofire

struct UserParams {
    var firstName: String?
    var middleName: String?
    var lastName: String?
    var gender: Gender?
    var birthdate: Date?
    var role: String = ""
    var phoneNumber: String?
    var email: String?
    var password: String = ""
    var repeatPassword: String = ""
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
