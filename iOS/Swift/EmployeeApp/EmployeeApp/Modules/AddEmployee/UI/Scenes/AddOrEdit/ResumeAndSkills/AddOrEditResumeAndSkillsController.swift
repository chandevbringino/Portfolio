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
    
    @IBOutlet private(set) var technicalSkillsField: UITextField!
    @IBOutlet private(set) var personalSkillsField: UITextField!
}

// MARK: - Lifecycle

extension AddOrEditResumeAndSkillsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Bind

private extension AddOrEditResumeAndSkillsController {
}

// MARK: - Setup

private extension AddOrEditResumeAndSkillsController {
    func setup() {
        // Do setup here
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
}
