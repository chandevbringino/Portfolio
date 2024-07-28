//
//  CreateAccountController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/27/24.
//

import UIKit

class CreateAccountController: ViewController {
    var viewModel: CreateAccountViewModelProtocol!
    
    var onSignupSuccess: VoidResult?
    
    @IBOutlet private(set) var roleFIeld: UITextField!
    @IBOutlet private(set) var phoneNumberField: UITextField!
    @IBOutlet private(set) var emailField: UITextField!
    @IBOutlet private(set) var passwordField: UITextField!
    @IBOutlet private(set) var repeatPasswordField: UITextField!
    @IBOutlet private(set) var createAccountButton: UIButton!
}

// MARK: - Lifecycle

extension CreateAccountController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension CreateAccountController {
    func setup() {
        setupNavBar()
        setupButtons()
    }
    
    func setupNavBar() {
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    func setupButtons() {
        createAccountButton.layer.cornerRadius = 4
        createAccountButton.layer.borderWidth = 1
        createAccountButton.layer.borderColor = UIColor.darkGray.cgColor
    }
}

// MARK: - Actions

private extension CreateAccountController {
    @IBAction
    func signupButtonTapped() {
        showLoader()
        
        let userParams = UserParams(
            role: roleFIeld.text!,
            phoneNumber: phoneNumberField.text!,
            email: emailField.text!, 
            password: passwordField.text!,
            repeatPassword: repeatPasswordField.text!
        )
        
        viewModel.registerUser(
            userParams: userParams,
            onSuccess: handleSignupSuccess(),
            onError: handleError()
        )
    }
}

// MARK: - Handlers

private extension CreateAccountController {
    func handleSignupSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.onSignupSuccess?()
        }
    }
}
