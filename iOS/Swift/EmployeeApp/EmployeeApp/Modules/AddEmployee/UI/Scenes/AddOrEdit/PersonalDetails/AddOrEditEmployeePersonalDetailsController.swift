//
//  AddOrEditEmployeePersonalDetailsController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit

class AddOrEditEmployeePersonalDetailsController: ViewController {
    var viewModel: AddOrEditEmployeePersonalDetailsViewModelProtocol!
    var onContinue: VoidResult?
    
    @IBOutlet private(set) var firstNameField: UITextField!
    @IBOutlet private(set) var middlenameField: UITextField!
    @IBOutlet private(set) var lastnameField: UITextField!
    @IBOutlet private(set) var genderField: UITextField!
    @IBOutlet private(set) var birthdayField: UITextField!
    @IBOutlet private(set) var continueButton: UIButton!
    
    private var genderPicker: GenericPickerView?
    
    private var selectedBdayDate: Date?
    private var selectedGender: Gender?
}

// MARK: - Lifecycle

extension AddOrEditEmployeePersonalDetailsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension AddOrEditEmployeePersonalDetailsController {
    func setup() {
        setupNavBar()
        setupButtons()
        setupPickerView()
        setupDatePicker()
        setupFields()
    }
    
    func setupNavBar() {
//        title = viewModel.isEditPost ? S.edit() : S.add()
        
//        let rightButton = UIBarButtonItem(
//            title: "Save",
//            style: .plain,
//            target: self,
//            action: #selector(saveButtonTapped)
//        )
        
//        navigationItem.leftBarButtonItem = rightButton
        
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
        birthdayField.inputView = picker
    }
    
    func setupFields() {
        firstNameField.text = viewModel.firstname
        middlenameField.text = viewModel.middlename
        lastnameField.text = viewModel.lastname
        genderField.text = viewModel.gender
        birthdayField.text = viewModel.birthday
    }
}

// MARK: - Methods

private extension AddOrEditEmployeePersonalDetailsController {
    func savePost() {
        showLoader()
//        viewModel.savePost(
//            title: fullnameField.text!,
//            body: designationField.text!,
//            onSuccess: handleSavePostSuccess(),
//            onError: handleError()
//        )
    }
}

// MARK: - Actions

private extension AddOrEditEmployeePersonalDetailsController {
    @IBAction
    func continueButtonTapped() {
        let param = EmployeeParams(
            firstname: firstNameField.text!,
            middlename: middlenameField.text!,
            lastname: lastnameField.text!,
            gender: selectedGender,
            birthdate: selectedBdayDate
        )
        
        viewModel.cacheEmployeeDetails(
            employeeParam: param,
            onSuccess: trigger(\.onContinue),
            onError: handleError()
        )
    }
    
    @objc
    func didSelectDate(sender: UIDatePicker) {
        birthdayField.text = viewModel.dateText(from: sender.date)
        selectedBdayDate = sender.date
    }
    
    @objc
    func dismissVC() {
        dismiss(animated: true)
    }
}

// MARK: - Handlers

private extension AddOrEditEmployeePersonalDetailsController {
    func handleSavePostSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
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
