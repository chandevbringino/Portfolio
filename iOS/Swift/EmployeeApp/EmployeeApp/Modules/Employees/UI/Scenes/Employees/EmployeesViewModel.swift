//
//  EmployeesViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class EmployeesViewModel: EmployeesViewModelProtocol {
    var onCacheSelectedEmployee: SingleResult<EmployeeModel>?
    
    private var baseEmployees: [EmployeeModel] = []
    private var employees: [EmployeeModel] = []
    
    private let employeesService: EmployeesServiceProtocol
    private let authService: AuthServiceProtocol
    
    init(
        employeesService: EmployeesServiceProtocol = App.shared.employee,
        authService: AuthServiceProtocol = App.shared.auth
    ) {
        self.employeesService = employeesService
        self.authService = authService
    }
}

// MARK: - Methods

extension EmployeesViewModel {
    func clearFilter() {
        employees = baseEmployees
    }
    
    func cacheEmployee(at row: Int) {
        onCacheSelectedEmployee?(employees[row])
    }
    
    func filterEmployees(
        with text: String
    ) {
        let lowerCasedText = text.lowercased()
        let filteredEmployees = baseEmployees.filter(
            { $0.fullName.lowercased().contains(lowerCasedText) || $0.role.contains(lowerCasedText) })
        employees = filteredEmployees
    }
    
    func fetchEmployees(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        employeesService.getEmployees(
            onSuccess: handleGetEmployeesSuccess(thenExecute: onSuccess),
            onError: onError
        )
    }
    
    func signoutUser(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        authService.signoutUser(
            onSuccess: handleLogoutSuccess(thenExecute: onSuccess),
            onError: onError
        )
    }
    
    func employeeCellVM(at row: Int) -> EmployeeCollectionCellViewModelProtocol {
        EmployeeCollectionCellViewModel(employee: employees[row])
    }
}

// MARK: - Handlers

private extension EmployeesViewModel {
    func handleGetEmployeesSuccess(
        thenExecute onCompletion: @escaping VoidResult
    ) -> SingleResult<[EmployeeModel]> {
        { [weak self] employees in
            guard let self else { return }
            self.baseEmployees = employees
            self.employees = baseEmployees
            onCompletion()
        }
    }
    
    func handleLogoutSuccess(
        thenExecute onCompletion: @escaping VoidResult
    ) -> VoidResult {
        {
            // TODO: - Delete persisted user in realmswift
            onCompletion()
        }
    }
}

// MARK: - Getters

extension EmployeesViewModel {
    var employeesCount: Int { employees.count }
}
