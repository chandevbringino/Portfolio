//
//  
//  SkillsViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/30/24.
//
//
import Foundation

protocol SkillsViewModelProtocol {
    var skillsCount: Int { get }
    var isTechnicalSkills: Bool { get }
    
    func skillCellVM(at row: Int) -> SkillTableCellViewModelProtocol
}
