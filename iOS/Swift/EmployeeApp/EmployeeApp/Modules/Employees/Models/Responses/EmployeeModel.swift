//
//  EmployeeModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/30/24.
//

import Foundation
import FirebaseFirestore

struct EmployeeModel: Codable {
    @DocumentID var id: String?
    var email: String
    var firstName: String
    var middleName: String?
    var lastName: String
    var phoneNumber: String
    var gender: Gender
    var birthDate: Date
    var role: String
    var isCurrentEmployedHere: Bool
    var startDate: Date
    var endDate: Date?
    var reasonForLeaving: String?
    var resume: String
    var personalSkills: [String]
    var technicalSkills: [String]
    var imageURL: String?
    
    var fullName: String {
        guard let middleName else {
            return firstName + " " + lastName
        }
        
        return firstName + " " + middleName + " " + lastName
    }
    
    init(
        email: String,
        firstName: String,
        middleName: String?,
        lastName: String,
        phoneNumber: String,
        gender: Gender,
        birthDate: Date,
        role: String,
        isCurrentEmployedHere: Bool,
        startDate: Date,
        endDate: Date?,
        reasonForLeaving: String?,
        resume: String,
        personalSkills: [String],
        technicalSkills: [String],
        imageURL: String?
    ) {
        self.email = email
        self.firstName = firstName
        self.middleName = middleName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.gender = gender
        self.birthDate = birthDate
        self.role = role
        self.isCurrentEmployedHere = isCurrentEmployedHere
        self.startDate = startDate
        self.endDate = endDate
        self.reasonForLeaving = reasonForLeaving
        self.resume = resume
        self.personalSkills = personalSkills
        self.technicalSkills = technicalSkills
        self.imageURL = imageURL
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
        case isCurrentEmployedHere = "is_current_employed_here"
        case startDate = "start_date"
        case endDate = "end_date"
        case reasonForLeaving = "reason_for_leaving"
        case resume
        case personalSkills = "personal_skills"
        case technicalSkills = "technical_skills"
        case imageURL = "image_url"
    }
}
