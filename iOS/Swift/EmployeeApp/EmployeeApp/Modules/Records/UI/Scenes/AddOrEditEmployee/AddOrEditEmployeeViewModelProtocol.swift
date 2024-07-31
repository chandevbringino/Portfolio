//
//  AddOrEditEmployeeViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol AddOrEditEmployeeViewModelProtocol {
    var title: String { get }
    var body: String { get }
    
    var isEditPost: Bool { get }
    
    func savePost(
        title: String,
        body: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
