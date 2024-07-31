//
//  EmployeesCoordinator.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

final class EmployeesCoordinator: NavCoordinator {
    var onLogoutSuccess: VoidResult?
    
    private var cachedEmployee: EmployeeModel?
    private var cachedSkills: [String]?
    
    private let service: EmployeesServiceProtocol
    
    init(
        service: EmployeesServiceProtocol = App.shared.employee,
        navRouter: any NavRouterProtocol
    ) {
        self.service = service
        
        super.init(navRouter: navRouter)
    }
    
    override func start() {
        setRootToEmployeesScene()
    }
}

// MARK: - Employees Scene

extension EmployeesCoordinator {
    func setRootToEmployeesScene() {
        let vm = EmployeesViewModel()
        vm.onCacheSelectedEmployee = handleCacheEmployee()
        
        let vc = R.storyboard.employees.employeesController()!
        vc.viewModel = vm
        vc.onLogoutSuccess = trigger(\.onLogoutSuccess)
        vc.onNavigateToDetails = trigger(type(of: self).navigateToEmployeeDetailsScene)
        vc.onNavigateToAddPost = trigger(type(of: self).presentAddEmployee)
//        vc.onEditPost = trigger(type(of: self).presentEditPost)
        
        navRouter.setRoot(vc, animated: true)
    }
    
    func handleCacheEmployee() -> SingleResult<EmployeeModel> {
        { [weak self] employee in
            guard let self else { return }
            self.cachedEmployee = employee
        }
    }
}

// MARK: - Add Employee Scene

extension EmployeesCoordinator {
    func presentAddEmployee() {
        let vc = R.storyboard.addOrEditEmployee.addOrEditEmployeeController()!
        
        vc.viewModel = AddOrEditEmployeeViewModel()
        vc.onSaveSuccess = triggerDismiss()
        
        let nc = NavigationController(rootViewController: vc)
        
        navRouter.present(nc, animated: true)
    }
    
    func presentEditPost() {
        guard let cachedEmployee else { return }
        let vc = R.storyboard.addOrEditEmployee.addOrEditEmployeeController()!
//        vc.viewModel = AddOrEditPostViewModel(post: cachedPost)
        vc.onSaveSuccess = triggerDismiss()
        
        let nc = NavigationController(rootViewController: vc)
        
        navRouter.present(nc, animated: true)
    }
}

// MARK: - EmployeeDetails Scene

extension EmployeesCoordinator {
    func navigateToEmployeeDetailsScene() {
        guard let cachedEmployee else { return }
        
        let vm = EmployeeDetailsViewModel(employee: cachedEmployee)
        vm.onCacheSkills = handleCacheSkills()
        
        let vc = R.storyboard.employeeDetails.employeeDetailsController()!
        vc.viewModel = vm
        vc.onNavigateToSkills = handleNavigateToSkills()
        
        navRouter.push(vc, animated: true)
    }
    
    func handleCacheSkills() -> SingleResult<[String]> {
        { [weak self] skills in
            guard let self else { return }
            self.cachedSkills = skills
        }
    }
    
    func handleNavigateToSkills() -> SingleResult<IsTechnicalSkill> {
        { [weak self] isTechSkills in
            guard let self else { return }
            self.navigateToEmployeeSkillsScene(isTechSkill: isTechSkills)
        }
    }
}

// MARK: - EmployeeSkills Scene

extension EmployeesCoordinator {
    func navigateToEmployeeSkillsScene(isTechSkill: Bool) {
        guard let cachedSkills else { return }
        
        let vc = R.storyboard.employeeDetails.skillsController()!
        vc.viewModel = SkillsViewModel(
            skills: cachedSkills,
            isTechnicalSkills: isTechSkill
        )
        navRouter.push(vc, animated: true)
    }
}
