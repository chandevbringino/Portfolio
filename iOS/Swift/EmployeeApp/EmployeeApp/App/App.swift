//
//  App.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import UIKit

class App {
    static let shared = App()
    
    private(set) var config: AppConfigProtocol!
    
    // MARK: - Firebase
    
    private(set) var auth: AuthServiceProtocol!
    private(set) var employee: EmployeesServiceProtocol!
    
    func bootstrap(
      with application: UIApplication,
      launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        config = AppConfig()
        auth = AuthService()
        employee = EmployeesService()
    }
}

enum AppError: Error {
    case mustNotBeEmpty(fieldName: String)
    case passwordAndRepeatPasswordNotMatched
    case error(reason: String)
    case dataNotFound
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .dataNotFound:
            return "Data not found."
        case .mustNotBeEmpty(let fieldName):
            return "\(fieldName) must not be empty"
        case .passwordAndRepeatPasswordNotMatched:
            return "Password and Repeat Password is not matched"
        case .error(let reason):
            return reason
        }
    }
}
