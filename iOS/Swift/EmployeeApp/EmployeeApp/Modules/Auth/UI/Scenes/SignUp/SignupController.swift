//
//  SignupController.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit

class SignupController: ViewController {
    var viewModel: SignupViewModelProtocol!
    
    @IBOutlet private(set) var fullnameField: UITextField!
    @IBOutlet private(set) var emailField: UITextField!
    @IBOutlet private(set) var phoneNumberField: UITextField!
    @IBOutlet private(set) var passwordField: UITextField!
    @IBOutlet private(set) var repeatPasswordField: UITextField!
    @IBOutlet private(set) var signupButton: UIButton!
}

// MARK: - Lifecycle

extension SignupController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension SignupController {
    func setup() {
        setupButtons()
    }
    
    func setupButtons() {
        signupButton.layer.cornerRadius = 4
        signupButton.layer.borderWidth = 1
        signupButton.layer.borderColor = UIColor.darkGray.cgColor
    }
}

// MARK: - Actions

private extension SignupController {
    @IBAction
    func signupButtonTapped() {
        showLoader()
        viewModel.registerUser(
            name: fullnameField.text!,
            phoneNumber: phoneNumberField.text!,
            email: emailField.text!,
            password: passwordField.text!,
            repeatPassword: repeatPasswordField.text!,
            onSuccess: handleSignupSuccess(),
            onError: handleError()
        )
    }
}

// MARK: - Handlers

private extension SignupController {
    func handleSignupSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.presentRecordsScene()
        }
    }
}

// MARK: - Routers

private extension SignupController {
    func presentRecordsScene() {
        let vc = R.storyboard.posts.postsController()!
        vc.viewModel = viewModel.recordsVM
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .fullScreen
        present(nc, animated: true)
    }
}
