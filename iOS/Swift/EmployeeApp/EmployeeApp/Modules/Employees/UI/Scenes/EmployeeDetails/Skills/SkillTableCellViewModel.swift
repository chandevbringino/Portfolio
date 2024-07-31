//
//  
//  SkillTableCellViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/30/24.
//
//
import Foundation

class SkillTableCellViewModel: SkillTableCellViewModelProtocol {
    private let skill: String
    
    init(skill: String) {
        self.skill = skill
    }
}

// MARK: - Getters

extension SkillTableCellViewModel {
    var skillText: String { skill }
}
