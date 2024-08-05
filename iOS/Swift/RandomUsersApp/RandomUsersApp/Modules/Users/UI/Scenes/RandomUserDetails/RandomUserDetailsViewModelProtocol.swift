//
//  
//  RandomUserDetailsViewModelProtocol.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//
//
import Foundation

protocol RandomUserDetailsViewModelProtocol {
    var fullname: String { get }
    var firstname: String { get }
    var lastname: String { get }
    var birthday: String { get }
    var age: String { get }
    var email: String { get }
    var mobileNumber: String { get }
    var address: String { get }
    
    var imageURL: URL? { get }
}
