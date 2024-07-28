//
//  SignUpCoordinator.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

final class SignUpCoordinator: NavCoordinator {
    var onSignupSuccess: VoidResult?
    
    private var cachedUserParams: UserParams?
    
    private let service: AuthServiceProtocol
    
    init(
        navRouter: NavRouterProtocol,
        service: AuthServiceProtocol = App.shared.auth
    ) {
        self.service = service
        
        super.init(navRouter: navRouter)
    }
    
    override func start() {
        navigateToPersonalDetails()
    }
}

// MARK: - PersonalDetails Scene

extension SignUpCoordinator {
    func navigateToPersonalDetails() {
        let vm = PersonalDetailsViewModel()
        vm.onCacheUserParams = handleCacheUserParams()
        
        let vc = R.storyboard.personalDetails.personalDetailsController()!
        vc.viewModel = vm
        
        vc.onContinue = trigger(type(of: self).navigateToCreateAccount)
        
        navRouter.push(vc, animated: true)
    }
    
    func handleCacheUserParams() -> SingleResult<UserParams> {
        { [weak self] userParams in
            guard let self else { return }
            self.cachedUserParams = userParams
        }
    }
}

// MARK: - CreateAccount Scene

extension SignUpCoordinator {
    func navigateToCreateAccount() {
        guard let cachedUserParams else { return }
        
        let vc = R.storyboard.createAccount.createAccountController()!
        vc.viewModel = CreateAccountViewModel(
            service: service,
            userParams: cachedUserParams
        )
        vc.onSignupSuccess = trigger(\.onSignupSuccess)
      
        navRouter.push(vc, animated: true)
    }
}
