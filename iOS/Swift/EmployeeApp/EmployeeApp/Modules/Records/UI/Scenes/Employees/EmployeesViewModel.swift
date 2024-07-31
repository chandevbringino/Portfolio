//
//  EmployeesViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class EmployeesViewModel: EmployeesViewModelProtocol {
    var onCacheSelectedEmployee: SingleResult<EmployeeModel>?
    
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
    func cacheEmployee(at row: Int) {
        onCacheSelectedEmployee?(employees[row])
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
            self.employees.append(employees[0])
            self.employees.append(employees[0])
            self.employees.append(employees[0])
            self.employees.append(employees[0])
            self.employees.append(employees[0])
            self.employees.append(employees[0])
            self.employees.append(employees[0])
            self.employees.append(employees[0])
            self.employees.append(employees[0])
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
    
    var addPostVM: AddOrEditEmployeeViewModelProtocol { AddOrEditEmployeeViewModel() }
}
