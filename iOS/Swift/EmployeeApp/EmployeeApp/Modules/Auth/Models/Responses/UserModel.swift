//
//  UserModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import FirebaseAuth

struct UserModel: Codable {
    let id: String
    let email: String
    let firstName: String
    let middleName: String?
    let lastName: String
    let phoneNumber: String
    let gender: Gender
    let birthDate: Date
    let role: String
    
    init(
        id: String,
        email: String,
        firstName: String,
        middleName: String?,
        lastName: String,
        phoneNumber: String,
        gender: Gender,
        birthDate: Date,
        role: String
    ) {
        self.id = id
        self.email = email
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.gender = gender
        self.birthDate = birthDate
        self.role = role
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case middleName = "middle_name"
        case lastName = "last_name"
        case phoneNumber = "phone_number"
        case gender
        case birthDate = "birth_date"
        case role
    }
}

enum Gender: String, Codable {
    case male
    case female
    case other
}
