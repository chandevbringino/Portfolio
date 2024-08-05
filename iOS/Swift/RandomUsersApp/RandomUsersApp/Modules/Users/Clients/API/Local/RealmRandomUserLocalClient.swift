//
//  RealmRandomUserLocalClient.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/4/24.
//

import Foundation
import RealmSwift

final class RealmRandomUserLocalClient: RandomUserLocalClientProtocol {
    private let realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
}

// MARK: - Methods

extension RealmRandomUserLocalClient {
    func fetchUsers(
        page: Page,
        onSuccess: @escaping SingleResult<[UserModel]>,
        onError: @escaping ErrorResult
    ) {
        let realmUsers = realm.objects(RealmUserModel.self)
        
        var endIndex = page.size * page.page
        let startIndex = endIndex - page.size
        
        if endIndex > realmUsers.count {
          endIndex = startIndex + (realmUsers.count % page.size)
        }
        
        if startIndex == endIndex {
          return onSuccess([])
        }
        
        let rangedRealmUsers = realmUsers[startIndex..<endIndex]
        
        let users = Array(rangedRealmUsers.compactMap(UserRealmModelMapper.userModel(realmUser:)))
        onSuccess(users)
    }
    
    func saveUsers(
        _ users: [UserModel],
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        do {
            let realmUsers = users.map(UserRealmModelMapper.realmUserModel(userModel:))
            
            try realm.write {
                realm.add(realmUsers, update: .modified)
                onSuccess()
            }
        } catch {
            onError(error)
        }
    }
    
    func deleteRealmUsers(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        let realmUsers = realm.objects(RealmUserModel.self)
        
        if realmUsers.isEmpty {
            return onSuccess()
        }
        
        do {
            try realm.write {
                realm.delete(realmUsers)
                onSuccess()
            }
        } catch {
            onError(error)
        }
    }
}
