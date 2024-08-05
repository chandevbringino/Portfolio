//
//  RealmUserModel.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/4/24.
//

import Foundation
import RealmSwift

// MARK: - User Model

class RealmUserModel: Object {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var name: RealmName?
    @Persisted var location: RealmLocation?
    @Persisted var email: String = ""
    @Persisted var dob: RealmDateOfBirth?
    @Persisted var phone: String = ""
    @Persisted var cell: String = ""
    @Persisted var picture: RealmPicture?
}

// MARK: - Name

class RealmName: Object {
    @Persisted var title: String
    @Persisted var first: String
    @Persisted var last: String
}

// MARK: - Location

class RealmLocation: Object {
    @Persisted var street: RealmStreet?
    @Persisted var city: String?
    @Persisted var state: String?
    @Persisted var country: String?
}

// MARK: - Street

class RealmStreet: Object {
    @Persisted var number: Int?
    @Persisted var name: String?
}

// MARK: - DateOfBirth

class RealmDateOfBirth: Object {
    @Persisted var date: String?
    @Persisted var age: Int?
}

// MARK: - Picture

class RealmPicture: Object {
    @Persisted var large: String?
    @Persisted var medium: String?
    @Persisted var thumbnail: String?
}
