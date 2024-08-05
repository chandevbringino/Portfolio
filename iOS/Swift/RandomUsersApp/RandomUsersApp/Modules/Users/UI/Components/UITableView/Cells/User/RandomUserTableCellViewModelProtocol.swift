//
//  
//  RandomUserTableCellViewModelProtocol.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//
//
import Foundation

protocol RandomUserTableCellViewModelProtocol {
    var fullname: String { get }
    var email: String { get }
    
    var imageURL: URL? { get }
}
