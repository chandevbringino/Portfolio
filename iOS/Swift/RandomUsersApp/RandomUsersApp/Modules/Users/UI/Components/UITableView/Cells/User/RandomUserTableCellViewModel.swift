//
//  
//  RandomUserTableCellViewModel.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//
//
import Foundation

class RandomUserTableCellViewModel: RandomUserTableCellViewModelProtocol {
    private let user: UserModel
    
    init(user: UserModel) {
        self.user = user
    }
}

// MARK: - Getters

extension RandomUserTableCellViewModel {
    var fullname: String { name.first + " " + name.last }
    var email: String { user.email }
    
    var imageURL: URL? { URL(string: user.picture.large ?? "") }
    
    private var name: Name { user.name }
}
