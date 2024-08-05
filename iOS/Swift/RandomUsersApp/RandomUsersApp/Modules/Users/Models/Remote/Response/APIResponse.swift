//
//  APIResponse.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//

import Foundation

// MARK: - Main Structure

struct APIResponse: Codable {
    let results: [UserModel]
}
