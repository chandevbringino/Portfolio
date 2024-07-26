//
//  APIClient.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/26/24.
//

import Foundation

class APIClient: APIClientProtocol {
    var baseURL: URL { URL(string: App.shared.config.apiUrl)! }
    
    func request() {
        
    }
}
