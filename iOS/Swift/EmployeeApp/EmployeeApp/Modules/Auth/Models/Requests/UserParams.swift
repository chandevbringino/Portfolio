//
//  UserParams.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import Alamofire

struct UserParams {
    var username: String
    var email: String
    var name: String
    var password: String
}

extension UserParams {
    var params: Parameters {
        var params = Parameters()
        
        params["username"] = username
        params["password"] = password
        params["email"] = email
        params["name"] = name
        
        return params
    }
}
