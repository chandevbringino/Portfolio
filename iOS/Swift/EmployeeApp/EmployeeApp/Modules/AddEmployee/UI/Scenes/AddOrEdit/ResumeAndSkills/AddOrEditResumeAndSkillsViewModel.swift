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
    var onCacheResumeURL: SingleResult<URL>?
    
    private var params: EmployeeParams
    private var employee: EmployeeModel?
    
    private var _resumeURL: URL?
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
        _resumeURL = URL(string: employee?.resume ?? "")
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
        _resumeURL = url
        onCacheResumeURL?(url)
    }
    
    func cacheEmployeeDetails(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        params.technicalSkills = toBeSavedTechSkills
        params.personalSkills = toBeSavedPersonalSkills
        params.resumeLocalURL = _resumeURL
        
        if let error = validate(params: params) {
            return onError(error)
        }
        
        onCacheEmployee?(params)
        onSuccess()
    }
    
    // TODO: - For improvement. Must be "unit" testable
    func validate(params: EmployeeParams) -> Error? {
        if (params.technicalSkills ?? []).isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Technical skills")
        } else if (params.personalSkills ?? []).isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Personal skills")
        } else if params.resumeLocalURL == nil {
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
        guard let resumeURL = _resumeURL else { return "" }
        let strings = resumeURL.absoluteString.components(separatedBy: "/")
        return strings.last ?? ""
    }
    
    var resumeURL: URL? { _resumeURL }
}
