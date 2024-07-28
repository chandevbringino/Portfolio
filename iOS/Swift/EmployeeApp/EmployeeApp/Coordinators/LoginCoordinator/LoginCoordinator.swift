//
//  LoginCoordinator.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

final class LoginCoordinator: NavCoordinator {
    var onLoginSuccess: VoidResult?
    var onSignupSuccess: VoidResult?
    
    private let config: AppConfigProtocol
    private let authService: AuthServiceProtocol
    
    init(
        navRouter: NavRouterProtocol,
        config: AppConfigProtocol = App.shared.config,
        authService: AuthServiceProtocol = App.shared.auth
    ) {
        self.config = config
        self.authService = authService
        
        super.init(navRouter: navRouter)
    }
    
    override func start() {
        setRootToLoginScene()
    }
}

// MARK: - Login Scene

extension LoginCoordinator {
  func setRootToLoginScene() {
      let vc = R.storyboard.login.loginController()!
      vc.viewModel = LoginViewModel(
        service: authService
      )
      vc.onLoginSuccess = trigger(\.onLoginSuccess)
      vc.onCreateAccount = trigger(type(of: self).startSignupCoordinator)
      navRouter.setRoot(vc, animated: true)
  }
}

// MARK: - SignUp Coordinator

extension LoginCoordinator {
    func startSignupCoordinator() {
        let coordinator = SignUpCoordinator(
            navRouter: navRouter
        )
        coordinator.onSignupSuccess = trigger(\.onLoginSuccess)
        
        startChild(coordinator)
    }
}
