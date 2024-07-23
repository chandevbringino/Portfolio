//
//  LoginController.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit
import SVProgressHUD

class LoginController: ViewController {
    var viewModel: LoginViewModelProtocol!
    
    @IBOutlet private(set) var usernameTextField: UITextField!
    @IBOutlet private(set) var passwordTextField: UITextField!
    @IBOutlet private(set) var loginButton: UIButton!
    @IBOutlet private(set) var signupLabel: UILabel!
}

// MARK: - Lifecycle

extension LoginController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
            username: usernameTextField.text!,
            password: passwordTextField.text!,
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
        let vc = R.storyboard.signUp.signupController()!
        vc.viewModel = viewModel.signupVM
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentRecordsScene() {
        let vc = R.storyboard.posts.postsController()!
        vc.viewModel = viewModel.postsVM
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        present(nc, animated: true)
    }
}
