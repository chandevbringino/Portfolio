//
//  
//  EmployeeCollectionCellViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/30/24.
//
//
import Foundation

protocol EmployeeCollectionCellViewModelProtocol {
    var name: String { get }
    var role: String { get }
    var imageURL: URL? { get }
}
