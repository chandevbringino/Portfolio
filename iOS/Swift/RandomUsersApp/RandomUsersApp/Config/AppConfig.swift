//
//  AppConfig.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//

import Foundation

protocol AppConfigProtocol {
    var baseUrl: String { get }
}

// MARK: - Default values

extension AppConfigProtocol {
    var apiUrl: String { "\(baseUrl)/api" }
}

struct AppConfig: AppConfigProtocol {
    var baseUrl: String { "https://randomuser.me" }
}
