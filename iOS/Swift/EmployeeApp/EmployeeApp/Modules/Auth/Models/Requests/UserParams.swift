//
//  UserParams.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import Alamofire

struct UserParams {
    var name: String
    var phoneNumber: String
    var email: String
    var password: String
    var repeatPassword: String
}

extension UserParams {
    var params: Parameters {
        var params = Parameters()
        // TODO: - Remove this and apply codable protocol
        params["phoneNumber"] = phoneNumber
        params["password"] = password
        params["email"] = email
        params["name"] = name
        
        return params
    }
}
