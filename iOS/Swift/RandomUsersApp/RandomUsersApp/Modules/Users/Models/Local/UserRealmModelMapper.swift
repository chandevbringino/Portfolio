//
//  UserRealmModelMapper.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/4/24.
//

import Foundation

struct UserRealmModelMapper { }

// MARK: - UserModel to RealmUserModel

extension UserRealmModelMapper {
    static func realmUserModel(userModel: UserModel) -> RealmUserModel {
        let realmUser = RealmUserModel()
        realmUser.id = UUID().hashValue
        realmUser.name = realmName(name: userModel.name)
        realmUser.location = realmLocation(location: userModel.location)
        realmUser.email = userModel.email
        realmUser.dob = realmDob(dob: userModel.dob)
        realmUser.phone = userModel.phone
        realmUser.cell = userModel.cell
        realmUser.picture = realmPicture(picture: userModel.picture)
        return realmUser
    }
    
    static func realmName(name: Name) -> RealmName {
        let realmName = RealmName()
        realmName.first = name.first
        realmName.last = name.last
        realmName.title = name.title
        return realmName
    }
    
    static func realmLocation(location: Location) -> RealmLocation {
        let realmLocation = RealmLocation()
        realmLocation.street = realmStreet(street: location.street)
        realmLocation.state = location.state
        realmLocation.city = location.city
        realmLocation.country = location.country
        return realmLocation
    }
    
    static func realmStreet(street: Street) -> RealmStreet {
        let realm = RealmStreet()
        realm.name = street.name
        realm.number = street.number
        return realm
    }
    
    static func realmDob(dob: DateOfBirth) -> RealmDateOfBirth {
        let realm = RealmDateOfBirth()
        realm.date = dob.date
        realm.age = dob.age
        return realm
    }
    
    static func realmPicture(picture: Picture) -> RealmPicture {
        let realm = RealmPicture()
        realm.large = picture.large
        realm.medium = picture.medium
        realm.thumbnail = picture.thumbnail
        return realm
    }
}

// MARK: - RealmUserModel to UserModel

extension UserRealmModelMapper {
    static func userModel(realmUser: RealmUserModel) -> UserModel {
        UserModel(
            name: name(realmName: realmUser.name!),
            location: location(realmLoc: realmUser.location!),
            email: realmUser.email,
            dob: dob(realmDob: realmUser.dob!),
            phone: realmUser.phone,
            cell: realmUser.cell,
            picture: picture(realmPicture: realmUser.picture!)
        )
    }
    
    static func name(realmName: RealmName) -> Name {
        Name(
            title: realmName.title,
            first: realmName.first,
            last: realmName.last
        )
    }
    
    static func location(realmLoc: RealmLocation) -> Location {
        Location(
            street: street(realmStreet: realmLoc.street!),
            city: realmLoc.city,
            state: realmLoc.state,
            country: realmLoc.country
        )
    }
    
    static func street(realmStreet: RealmStreet) -> Street {
        Street(
            number: realmStreet.number,
            name: realmStreet.name
        )
    }
    
    static func dob(realmDob: RealmDateOfBirth) -> DateOfBirth {
        DateOfBirth(
            date: realmDob.date,
            age: realmDob.age
        )
    }
    
    static func picture(realmPicture: RealmPicture) -> Picture {
        Picture(
            large: realmPicture.large,
            medium: realmPicture.medium,
            thumbnail: realmPicture.thumbnail
        )
    }
}
