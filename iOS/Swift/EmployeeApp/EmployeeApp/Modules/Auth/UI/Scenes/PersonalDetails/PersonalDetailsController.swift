//
//  PersonalDetailsController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit

class PersonalDetailsController: ViewController {
    var viewModel: PersonalDetailsViewModelProtocol!
    
    @IBOutlet private(set) var firstnameField: UITextField!
    @IBOutlet private(set) var middleNameField: UITextField!
    @IBOutlet private(set) var lastnameField: UITextField!
    @IBOutlet private(set) var genderField: UITextField!
    @IBOutlet private(set) var birthdateField: UITextField!
    @IBOutlet private(set) var continueButton: UIButton!
}

// MARK: - Lifecycle

extension PersonalDetailsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension PersonalDetailsController {
    func setup() {
        setupNavBar()
        setupButtons()
        setupPickerView()
        setupDatePicker()
    }
    
    func setupNavBar() {
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    func setupButtons() {
        continueButton.layer.cornerRadius = 4
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    // TODO: - Create a component for UIPickerView
    func setupPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        genderField.inputView = pickerView
    }
    
    // TODO: - Create a component for UIDatePicker
    func setupDatePicker() {
        let picker = UIDatePicker()
        picker.sizeToFit()
        picker.preferredDatePickerStyle = .wheels
        picker.datePickerMode = .date
        picker.addTarget(self,
            action: #selector(didSelectDate(sender:)),
            for: .valueChanged
        )
        birthdateField.inputView = picker
    }
}

// MARK: - Actions

private extension PersonalDetailsController {
    @IBAction
    func signupButtonTapped() {
        showLoader()
        
        let userParams = UserParams(
            firstName: firstnameField.text!,
            middleName: middleNameField.text!,
            lastName: lastnameField.text!,
            gender: .male,
            birthdate: Date()
        )
        
        viewModel.registerUser(
            userParams: userParams,
            onSuccess: handleSignupSuccess(),
            onError: handleError()
        )
    }
    
    @objc
    func didSelectDate(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/d/yyyy"
        birthdateField.text = formatter.string(from: sender.date)
    }
}

// MARK: - Handlers

private extension PersonalDetailsController {
    func handleSignupSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.navigateToCreateAccountScene()
        }
    }
}

// MARK: - Routers

private extension PersonalDetailsController {
    func navigateToCreateAccountScene() {
        guard let vm = viewModel.createAccountVM else { return }
        let vc = R.storyboard.createAccount.createAccountController()!
        vc.viewModel = vm
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UIPickerViewDataSource

extension PersonalDetailsController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        viewModel.genderItems.count
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        viewModel.genderItems[row]
    }
}

// MARK: - UIPickerViewDelegate

extension PersonalDetailsController: UIPickerViewDelegate {
    func pickerView(
        _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ) {
        genderField.text = viewModel.genderItems[row]
    }
}
