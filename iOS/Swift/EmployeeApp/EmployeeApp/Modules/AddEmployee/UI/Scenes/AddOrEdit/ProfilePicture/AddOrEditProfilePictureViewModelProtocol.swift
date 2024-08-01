//
//  
//  AddOrEditProfilePictureViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/31/24.
//
//
import Foundation

protocol AddOrEditProfilePictureViewModelProtocol {
    var imageURL: URL? { get }
    
    func setImage(data: Data)
    
    func createEmployee(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
