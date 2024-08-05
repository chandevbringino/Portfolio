//
//  UserModel.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//

import Foundation

// MARK: - UserModel

struct UserModel: Codable {
    let name: Name
    let location: Location
    let email: String
    let dob: DateOfBirth
    let phone: String
    let cell: String
    let picture: Picture
}

// MARK: - Name

struct Name: Codable {
    let title: String
    let first: String
    let last: String
}

// MARK: - Location

struct Location: Codable {
    let street: Street
    let city: String?
    let state: String?
    let country: String?
}

// MARK: - Street

struct Street: Codable {
    let number: Int?
    let name: String?
}

// MARK: - DateOfBirth

struct DateOfBirth: Codable {
    let date: String?
    let age: Int?
}

// MARK: - Picture

struct Picture: Codable {
    let large: String?
    let medium: String?
    let thumbnail: String?
}
