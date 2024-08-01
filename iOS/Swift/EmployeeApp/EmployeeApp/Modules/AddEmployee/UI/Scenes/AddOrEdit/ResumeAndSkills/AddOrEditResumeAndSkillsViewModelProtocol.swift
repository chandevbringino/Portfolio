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
    var resumeText: String { get }
    
    var resumeURL: URL? { get }
    
    func addTechnicalSkill(skill: String)
    func removeTechnicalSkill(skill: String)
    
    func addPersonalSkill(skill: String)
    func removePersonalSkill(skill: String)
    
    func setResume(url: URL)
    
    func cacheEmployeeDetails(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
