//
//  
//  AddOrEditProfessionalDetailsController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/31/24.
//
//

import Foundation
import UIKit

class AddOrEditProfessionalDetailsController: ViewController {
    var viewModel: AddOrEditProfessionalDetailsViewModelProtocol!
    var onContinue: VoidResult?
    
    @IBOutlet private(set) var emailField: UITextField!
    @IBOutlet private(set) var phoneNumberField: UITextField!
    @IBOutlet private(set) var roleField: UITextField!
    @IBOutlet private(set) var startDateField: UITextField!
    @IBOutlet private(set) var endDateField: UITextField!
    @IBOutlet private(set) var reasonForLeavingField: UITextField!
    @IBOutlet private(set) var continueButton: UIButton!
    
    private var selectedStartDate: Date?
    private var selectedEndDate: Date?
}

// MARK: - Lifecycle

extension AddOrEditProfessionalDetailsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension AddOrEditProfessionalDetailsController {
    func setup() {
        setupButtons()
        setupInitialFields()
        setupDatePicker()
    }
    
    func setupButtons() {
        continueButton.layer.cornerRadius = 4
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func setupInitialFields() {
        emailField.text = viewModel.email
        phoneNumberField.text = viewModel.phoneNumber
        roleField.text = viewModel.role
        startDateField.text = viewModel.startDateText
        endDateField.text = viewModel.endDateText
        reasonForLeavingField.text = viewModel.reasonForLeaving
    }
    
    func setupDatePicker() {
        let startDatePicker = UIDatePicker()
        startDatePicker.sizeToFit()
        startDatePicker.preferredDatePickerStyle = .wheels
        startDatePicker.datePickerMode = .date
        startDatePicker.addTarget(self,
            action: #selector(didSelectStartDate(sender:)),
            for: .valueChanged
        )
        startDateField.inputView = startDatePicker
        
        let endDatePicker = UIDatePicker()
        endDatePicker.sizeToFit()
        endDatePicker.preferredDatePickerStyle = .wheels
        endDatePicker.datePickerMode = .date
        endDatePicker.addTarget(self,
            action: #selector(didSelectEndDate(sender:)),
            for: .valueChanged
        )
        endDateField.inputView = endDatePicker
    }
}

// MARK: - Methods

private extension AddOrEditProfessionalDetailsController {
}

// MARK: - Handlers

private extension AddOrEditProfessionalDetailsController {
}

// MARK: - Actions

private extension AddOrEditProfessionalDetailsController {
    @IBAction
    func continueButtonTapped() {
        let param = EmployeeParams(
            email: emailField.text!,
            phoneNumber: phoneNumberField.text!,
            role: roleField.text!,
            startDate: selectedStartDate,
            endDate: selectedEndDate,
            reasonForLeaving: reasonForLeavingField.text!
        )
        
        viewModel.cacheEmployeeDetails(
            employeeParam: param,
            onSuccess: trigger(\.onContinue),
            onError: handleError()
        )
    }
    
    @objc
    func didSelectStartDate(sender: UIDatePicker) {
        startDateField.text = viewModel.dateText(from: sender.date)
        selectedStartDate = sender.date
    }
    
    @objc
    func didSelectEndDate(sender: UIDatePicker) {
        endDateField.text = viewModel.dateText(from: sender.date)
        selectedEndDate = sender.date
    }
}
