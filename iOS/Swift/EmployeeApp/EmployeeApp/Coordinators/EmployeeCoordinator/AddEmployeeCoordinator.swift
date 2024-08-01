//
//  AddEmployeeCoordinator.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/31/24.
//

import Foundation

final class AddEmployeeCoordinator: NavCoordinator {
    var onFinish: VoidResult?
    
    private var cachedEmployeeParam: EmployeeParams?
    
    private let service: EmployeesServiceProtocol
    
    init(
        service: EmployeesServiceProtocol = App.shared.employee,
        navRouter: any NavRouterProtocol
    ) {
        self.service = service
        
        super.init(navRouter: navRouter)
    }
    
    override func start() {
        navigateToAddOrEditEmployee()
    }
}

// MARK: - AddOrEditEmployeePersonalDetails Scene

extension AddEmployeeCoordinator {
    func navigateToAddOrEditEmployee() {
        let vm = AddOrEditEmployeePersonalDetailsViewModel(service: service)
        vm.onCacheEmployee = handleCachingEmployee()
        
        let vc = R.storyboard.addOrEditEmployee.addOrEditEmployeePersonalDetailsController()!
        vc.viewModel = vm
        vc.onContinue = trigger(type(of: self).navigateToAddOrEditProfessionalDetails)
        
        navRouter.push(vc, animated: true)
    }
    
    func handleCachingEmployee() -> SingleResult<EmployeeParams> {
        { [weak self] param in
            guard let self else { return }
            self.cachedEmployeeParam = param
        }
    }
}

// MARK: - AddOrEditProfessionalDetails Scene

extension AddEmployeeCoordinator {
    func navigateToAddOrEditProfessionalDetails() {
        guard let cachedEmployeeParam else { return }
        let vm = AddOrEditProfessionalDetailsViewModel(
            service: service,
            params: cachedEmployeeParam
        )
        vm.onCacheEmployee = handleCachingEmployee()
        
        let vc = R.storyboard.addOrEditEmployee.addOrEditProfessionalDetailsController()!
        vc.viewModel = vm
        vc.onContinue = trigger(type(of: self).navigateToAddOrEditResumeAndSkills)
        
        navRouter.push(vc, animated: true)
    }
}

// MARK: - AddOrEditRe     tsumeAndSkills Scene

extension AddEmployeeCoordinator {
    func navigateToAddOrEditResumeAndSkills() {
        guard let cachedEmployeeParam else { return }
        let vm = AddOrEditResumeAndSkillsViewModel(
            service: service,
            params: cachedEmployeeParam
        )
        vm.onCacheEmployee = handleCachingEmployee()
        
        let vc = R.storyboard.addOrEditEmployee.addOrEditResumeAndSkillsController()!
        vc.viewModel = vm
        vc.onContinue = trigger(type(of: self).navigateToAddOrEditProfilePicture)
        vc.onNavigateToPDFViewer = trigger(type(of: self).navigateToEmployeeResumeScene)
        
        navRouter.push(vc, animated: true)
    }
}

// MARK: - AddOrEditProfilePicture Scene

extension AddEmployeeCoordinator {
    func navigateToAddOrEditProfilePicture() {
        guard let cachedEmployeeParam else { return }
        
        let vc = R.storyboard.addOrEditEmployee.addOrEditProfilePictureController()!
        vc.viewModel = AddOrEditProfilePictureViewModel(
            service: service,
            params: cachedEmployeeParam
        )
        vc.onFinish = trigger(\.onFinish)
        
        navRouter.push(vc, animated: true)
    }
}

// MARK: - EmployeeResume Scene

extension AddEmployeeCoordinator {
    func navigateToEmployeeResumeScene(url: URL) {
        let vc = R.storyboard.pdfViewer.pdfViewerController()!
        vc.viewModel = PDFViewModel(isLocalURL: true, url: url)
        navRouter.push(vc, animated: true)
    }
}
