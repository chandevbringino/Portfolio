//
//  EmployeeDetailsViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class EmployeeDetailsViewModel: EmployeeDetailsViewModelProtocol {
    var onCacheSkills: SingleResult<[String]>?
    
    private let employee: EmployeeModel
    
    init(employee: EmployeeModel) {
        self.employee = employee
    }
}

// MARK: - Methods

extension EmployeeDetailsViewModel {
    func cacheSkill(isTechnical: Bool) {
        let skills = isTechnical ? employee.technicalSkills : employee.personalSkills
        onCacheSkills?(skills)
    }
}

// MARK: - Getters

extension EmployeeDetailsViewModel {
    var imageURL: URL? { URL(string: employee.imageURL ?? "") }
    
    var fullname: String {
        employee.fullName
    }
    var role: String { employee.role }
    var email: String { employee.email }
    var contact: String { employee.phoneNumber }
    var gender: String { employee.gender.rawValue }
    var birthday: String {
        let formatter = Constants.Formatters.birthdateFormatter
        return formatter.string(from: employee.birthDate)
    }
    var startDateText: String {
        let formatter = Constants.Formatters.birthdateFormatter
        return formatter.string(from: employee.startDate)
    }
    var endDateText: String {
        guard let endDate = employee.endDate else { return "" }
        let formatter = Constants.Formatters.birthdateFormatter
        return formatter.string(from: endDate)
    }
    var reasonForLeaving: String {
        guard let reason =
                employee.reasonForLeaving else { return "N/A" }
        return reason.isEmpty ? "N/A" : reason
    }
    
    var isCurrentEmployedHere: Bool { employee.isCurrentEmployedHere }
    
    var resumeURL: URL? { URL(string: employee.resume) }
}
