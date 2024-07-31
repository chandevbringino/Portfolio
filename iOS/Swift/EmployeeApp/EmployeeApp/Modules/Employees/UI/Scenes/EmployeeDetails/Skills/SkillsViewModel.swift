//
//  
//  SkillsViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/30/24.
//
//
import Foundation

class SkillsViewModel: SkillsViewModelProtocol {
    private let skills: [String]
    private let _isTechnicalSkills: Bool
    
    init(
        skills: [String],
        isTechnicalSkills: Bool
    ) {
        self.skills = skills
        self._isTechnicalSkills = isTechnicalSkills
    }
}

// MARK: - Methods

extension SkillsViewModel {
    func skillCellVM(at row: Int) -> SkillTableCellViewModelProtocol {
        SkillTableCellViewModel(skill: skills[row])
    }
}

// MARK: - Getters

extension SkillsViewModel {
    var skillsCount: Int { skills.count }
    
    var isTechnicalSkills: Bool { _isTechnicalSkills }
}
