//
//  EmployeesCoordinator.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

final class EmployeesCoordinator: NavCoordinator {
    var onLogoutSuccess: VoidResult?
    
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
        let vc = R.storyboard.records.recordsController()!
        vc.viewModel = RecordsViewModel()
        vc.onLogoutSuccess = trigger(\.onLogoutSuccess)
        navRouter.setRoot(vc, animated: true)
    }
}
