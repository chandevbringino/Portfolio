//
//  PersonalDetailsController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit

class PersonalDetailsController: ViewController {
    var viewModel: PersonalDetailsViewModelProtocol!
    
    var onContinue: VoidResult?
    
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
        navigationController?.setNavigationBarHidden(false, animated: false)
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
        let userParams = UserParams(
            firstName: firstnameField.text!,
            middleName: middleNameField.text!,
            lastName: lastnameField.text!,
            gender: selectedGender,
            birthdate: selectedBdayDate
        )
        
        viewModel.cacheUserParams(
            userParams: userParams,
            onSuccess: trigger(\.onContinue),
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
    func handleSelectedOption() -> SingleResult<String> {
        { [weak self] text in
            guard let self else { return }
            let gender = Gender(rawValue: text)
            self.genderField.text = text
            self.selectedGender = gender
        }
    }
}
