//
//  
//  AddOrEditResumeAndSkillsViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/31/24.
//
//
import Foundation

class AddOrEditResumeAndSkillsViewModel: AddOrEditResumeAndSkillsViewModelProtocol {
    var onCacheEmployee: SingleResult<EmployeeParams>?
    
    private var params: EmployeeParams
    private var employee: EmployeeModel?
    
    private var resumeURL: URL?
    private var resumeData: Data?
    private var toBeSavedTechSkills: [String] = []
    private var toBeSavedPersonalSkills: [String] = []
    
    private let service: EmployeesServiceProtocol
    
    init(
        service: EmployeesServiceProtocol,
        params: EmployeeParams,
        employee: EmployeeModel? = nil
    ) {
        self.params = params
        self.service = service
        self.employee = employee
        
        toBeSavedTechSkills.append(contentsOf: employee?.technicalSkills ?? [])
        toBeSavedPersonalSkills.append(contentsOf: employee?.personalSkills ?? [])
        resumeURL = URL(string: employee?.resume ?? "")
    }
}

// MARK: - Methods

extension AddOrEditResumeAndSkillsViewModel {
    func addTechnicalSkill(skill: String) {
        toBeSavedTechSkills.append(skill)
    }
    
    func removeTechnicalSkill(skill: String) {
        guard let index = toBeSavedTechSkills.firstIndex(of: skill) else { return }
        toBeSavedTechSkills.remove(at: index)
    }
    
    func addPersonalSkill(skill: String) {
        toBeSavedPersonalSkills.append(skill)
    }
    
    func removePersonalSkill(skill: String) {
        guard let index = toBeSavedPersonalSkills.firstIndex(of: skill) else { return }
        toBeSavedPersonalSkills.remove(at: index)
    }
    
    func setResume(url: URL) {
        resumeURL = url
        resumeData = url.dataRepresentation
    }
    
    func cacheEmployeeDetails(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        let param = EmployeeParams(
            technicalSkills: toBeSavedTechSkills,
            personalSkills: toBeSavedPersonalSkills,
            resumeData: resumeData
        )
        
        if let error = validate(params: param) {
            return onError(error)
        }
        
        onCacheEmployee?(param)
        onSuccess()
    }
    
    // TODO: - For improvement. Must be "unit" testable
    func validate(params: EmployeeParams) -> Error? {
        if (params.technicalSkills ?? []).isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Technical skills")
        } else if (params.personalSkills ?? []).isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Personal skills")
        } else if params.resumeData == nil {
            return AppError.mustNotBeEmpty(fieldName: "Resume")
        }
        
        return nil
    }
}

// MARK: - Getters

extension AddOrEditResumeAndSkillsViewModel {
    var technicalSkills: [String] { employee?.technicalSkills ?? [] }
    var personalSkills: [String] { employee?.personalSkills ?? [] }
    var resumeText: String {
        guard let resumeURL else { return "" }
        let strings = resumeURL.absoluteString.components(separatedBy: "/")
        return strings.last ?? ""
    }
}
