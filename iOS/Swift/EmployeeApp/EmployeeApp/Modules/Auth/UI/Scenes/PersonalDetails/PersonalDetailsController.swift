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
    
    private var genderPicker: GenericPickerView?
    
    private var selectedBdayDate: Date?
    private var selectedGender: Gender?
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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    func setupButtons() {
        continueButton.layer.cornerRadius = 4
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func setupPickerView() {
        genderPicker = GenericPickerView()
        genderPicker?.viewModel = viewModel.genderPickerVM
        genderPicker?.onSelectOption = handleSelectedOption()
        genderPicker?.onReload?()
        
        genderPicker?.textField = genderField
    }
    
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
            gender: selectedGender,
            birthdate: selectedBdayDate
        )
        
        viewModel.registerUser(
            userParams: userParams,
            onSuccess: handleSignupSuccess(),
            onError: handleError()
        )
    }
    
    @objc
    func didSelectDate(sender: UIDatePicker) {
        birthdateField.text = viewModel.dateText(from: sender.date)
        selectedBdayDate = sender.date
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
    
    func handleSelectedOption() -> SingleResult<String> {
        { [weak self] text in
            guard let self else { return }
            let gender = Gender(rawValue: text)
            self.genderField.text = text
            self.selectedGender = gender
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
