//
//  UserModel.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import FirebaseAuth

struct UserModel: Codable {
    let id: String
    let email: String
    let name: String
    
    init(from user: User) {
        id = user.uid
        email = user.email ?? ""
        name = user.displayName ?? ""
    }
}
