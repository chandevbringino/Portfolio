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
    
    private let service: EmployeesServiceProtocol
    
    init(
        service: EmployeesServiceProtocol,
        params: EmployeeParams,
        employee: EmployeeModel? = nil
    ) {
        self.params = params
        self.service = service
        self.employee = employee
    }
}

// MARK: - Methods

extension AddOrEditResumeAndSkillsViewModel {
    func addTechnicalSkill(skill: String) {
        
    }
    
    func addPersonalSkill(skill: String) {
        
    }
    
    func cacheEmployeeDetails(
        employeeParam: EmployeeParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if let error = validate(params: employeeParam) {
            return onError(error)
        }
        
        onCacheEmployee?(employeeParam)
        onSuccess()
    }
    
    // TODO: - For improvement. Must be "unit" testable
    func validate(params: EmployeeParams) -> Error? {
        if (params.technicalSkills ?? []).isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Technical skills")
        } else if (params.personalSkills ?? []).isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Personal skills")
        } else if (params.resumeURL ?? "").isEmpty {
            return AppError.mustNotBeEmpty(fieldName: "Resume")
        }
        
        return nil
    }
}

// MARK: - Getters

extension AddOrEditResumeAndSkillsViewModel {
    var technicalSkills: [String] { employee?.technicalSkills ?? [] }
    var personalSkills: [String] { employee?.personalSkills ?? [] }
    var resumeURLText: String { employee?.resume ?? "" }
}
