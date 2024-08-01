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
    
    private let config: AppConfigProtocol
    private let service: EmployeesServiceProtocol
    
    init(
        config: AppConfigProtocol = App.shared.config,
        service: EmployeesServiceProtocol = App.shared.employee,
        navRouter: any NavRouterProtocol
    ) {
        self.config = config
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
        vc.onNavigateToAddEmployee = trigger(type(of: self).startAddEmployeeCoordinator)
        
        navRouter.setRoot(vc, animated: true)
    }
    
    func handleCacheEmployee() -> SingleResult<EmployeeModel> {
        { [weak self] employee in
            guard let self else { return }
            self.cachedEmployee = employee
        }
    }
}

// MARK: - AddEmployee Coordinator

extension EmployeesCoordinator {
    func startAddEmployeeCoordinator() {
        let coordinator = AddEmployeeCoordinator(navRouter: navRouter)
        
        coordinator.onFinish = triggerRemoveChild(
            coordinator,
            then: handleFinishAddOrEditEmployee()
        )
        
        startChild(coordinator)
    }
    
    func handleFinishAddOrEditEmployee() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.navRouter.popToRoot(animated: true)
        }
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
        vc.appDocumentPresenter = AppDocumentPresenter(config: config)
        vc.onNavigateToSkills = handleNavigateToSkills()
        vc.onNavigateToPDFViewer = trigger(type(of: self).navigateToEmployeeResumeScene)
        
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

// MARK: - EmployeeResume Scene

extension EmployeesCoordinator {
    func navigateToEmployeeResumeScene(url: URL) {
        let vc = R.storyboard.pdfViewer.pdfViewerController()!
        vc.viewModel = PDFViewModel(isLocalURL: false, url: url)
        navRouter.push(vc, animated: true)
    }
}
