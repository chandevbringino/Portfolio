//
//  APIResponse.swift
//  UserListApp
//
//  Created by Christian Bringino on 8/2/24.
//

import Foundation

// MARK: - Main Structure

struct APIResponse: Codable {
    let results: [User]
    let info: Info
}
