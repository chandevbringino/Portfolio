//
//  AppConfig.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol AppConfigProtocol {
  // MARK: Backend

  /// Backend server URL
  var baseUrl: String { get }

  /// API URL
  var apiUrl: String { get }
  
  // MARK: Password

  var minPasswordLength: Int { get }
  var maxPasswordLength: Int { get }

  // MARK: Others

  var secrets: AppSecretsProtocol { get }
}

// MARK: - Default values

extension AppConfigProtocol {
    var apiUrl: String { "\(baseUrl)/api" }
    
    var minPasswordLength: Int { 8 }
    var maxPasswordLength: Int { 32 }
}

// MARK: - Concrete Type

struct AppConfig: AppConfigProtocol {
  var baseUrl: String { "https://mobiletest.1902dev1.com" }

  var secrets: AppSecretsProtocol { AppSecrets() }
}
