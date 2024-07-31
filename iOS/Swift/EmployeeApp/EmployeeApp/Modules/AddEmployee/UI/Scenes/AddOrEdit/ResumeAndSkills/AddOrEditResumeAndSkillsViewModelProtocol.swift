//
//  
//  AddOrEditResumeAndSkillsViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/31/24.
//
//
import Foundation

protocol AddOrEditResumeAndSkillsViewModelProtocol {
    var technicalSkills: [String] { get }
    var personalSkills: [String] { get }
    var resumeURLText: String { get }
    
    func addTechnicalSkill(skill: String)
    func addPersonalSkill(skill: String)
    
    func cacheEmployeeDetails(
        employeeParam: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
