//
//  PostDetailsViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol PostDetailsViewModelProtocol {
    var imageURL: URL? { get }
    var title: String { get }
    var body: String { get }
}
