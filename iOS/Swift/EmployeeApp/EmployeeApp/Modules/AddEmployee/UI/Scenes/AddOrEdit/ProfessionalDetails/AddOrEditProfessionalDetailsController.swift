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
    
    @IBOutlet private(set) var emailField: UIView!
    @IBOutlet private(set) var phoneNumberField: UITextField!
    @IBOutlet private(set) var roleField: UITextField!
    @IBOutlet private(set) var startDateField: UITextField!
    @IBOutlet private(set) var endDateField: UITextField!
    @IBOutlet private(set) var reasonForLeavingField: UITextField!
    @IBOutlet private(set) var continueField: UIButton!
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
        // Do setup here
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
}
