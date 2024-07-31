//
//  EmployeeDetailsViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol EmployeeDetailsViewModelProtocol {
    var imageURL: URL? { get }
    var fullname: String { get }
    var role: String { get }
    var email: String { get }
    var contact: String { get }
    var gender: String { get }
    var birthday: String { get }
    var startDateText: String { get }
    var endDateText: String { get }
    var reasonForLeaving: String { get }
    
    var isCurrentEmployedHere: Bool { get }
    
    func cacheSkill(isTechnical: Bool)
}
