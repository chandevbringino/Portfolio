//
//  APIClient.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//

import Foundation
import Alamofire

class APIClient: APIClientProtocol {
    var baseUrl: String
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
}

// MARK: - Methods

extension APIClient {
    // Generic request
}
