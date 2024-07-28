//
//  LoginController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit
import SVProgressHUD

class LoginController: ViewController {
    var viewModel: LoginViewModelProtocol!
    
    @IBOutlet private(set) var emailField: UITextField!
    @IBOutlet private(set) var passwordField: UITextField!
    @IBOutlet private(set) var loginButton: UIButton!
    @IBOutlet private(set) var signupLabel: UILabel!
}

// MARK: - Lifecycle

extension LoginController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

// MARK: - Setup

private extension LoginController {
    func setup() {
        setupButtons()
    }
    
    func setupButtons() {
        loginButton.layer.cornerRadius = 4
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.darkGray.cgColor
    }
}

// MARK: - Actions

private extension LoginController {
    @IBAction
    func loginButtonTapped() {
        showLoader()
        viewModel.loginUser(
            email: emailField.text!,
            password: passwordField.text!,
            onSuccess: handleLoginSuccess(),
            onError: handleError()
        )
    }
    
    @IBAction
    func createAccountButtonTapped() {
        navigateToSignUpScene()
    }
}

// MARK: - Handlers

private extension LoginController {
    func handleLoginSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.presentRecordsScene()
        }
    }
}

// MARK: - Routers

private extension LoginController {
    func navigateToSignUpScene() {
        let vc = R.storyboard.personalDetails.personalDetailsController()!
        vc.viewModel = viewModel.signupVM
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentRecordsScene() {
        let vc = R.storyboard.records.recordsController()!
        vc.viewModel = viewModel.postsVM
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        present(nc, animated: true)
    }
}
