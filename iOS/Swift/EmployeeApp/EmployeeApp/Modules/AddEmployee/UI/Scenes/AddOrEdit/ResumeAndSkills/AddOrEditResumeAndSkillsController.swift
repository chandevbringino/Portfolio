//
//  
//  AddOrEditResumeAndSkillsController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/31/24.
//
//

import Foundation
import UIKit

class AddOrEditResumeAndSkillsController: ViewController {
    var viewModel: AddOrEditResumeAndSkillsViewModelProtocol!
    var onContinue: VoidResult?
    
    @IBOutlet private(set) var technicalSkillsField: UITextField!
    @IBOutlet private(set) var personalSkillsField: UITextField!
    @IBOutlet private(set) var resumeField: UITextField!
    @IBOutlet private(set) var continueButton: UIButton!
}

// MARK: - Lifecycle

extension AddOrEditResumeAndSkillsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension AddOrEditResumeAndSkillsController {
    func setup() {
        setupButtons()
    }
    
    func setupButtons() {
        continueButton.layer.cornerRadius = 4
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor.darkGray.cgColor
    }
}

// MARK: - Methods

private extension AddOrEditResumeAndSkillsController {
}

// MARK: - Handlers

private extension AddOrEditResumeAndSkillsController {
}

// MARK: - Actions

private extension AddOrEditResumeAndSkillsController {
    @IBAction
    func continueButtonTapped() {
        let param = EmployeeParams(
            technicalSkills: [],
            personalSkills: [],
            resumeURL: ""
        )
        
        viewModel.cacheEmployeeDetails(
            employeeParam: param,
            onSuccess: trigger(\.onContinue),
            onError: handleError()
        )
    }
}
