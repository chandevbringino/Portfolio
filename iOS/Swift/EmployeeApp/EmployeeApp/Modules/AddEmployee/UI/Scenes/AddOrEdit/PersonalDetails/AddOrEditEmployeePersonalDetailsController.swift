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
}

// MARK: - Lifecycle

extension AddOrEditEmployeePersonalDetailsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

// MARK: - Setup

private extension AddOrEditEmployeePersonalDetailsController {
    func setup() {
        setupNavBar()
        setupFields()
    }
    
    func setupNavBar() {
//        title = viewModel.isEditPost ? S.edit() : S.add()
//        
//        let leftButton = UIBarButtonItem(
//            title: "Cancel",
//            style: .plain,
//            target: self,
//            action: #selector(dismissVC)
//        )
//        
//        let rightButton = UIBarButtonItem(
//            title: "Save",
//            style: .plain,
//            target: self,
//            action: #selector(saveButtonTapped)
//        )
//        
//        navigationItem.leftBarButtonItem = leftButton
//        navigationItem.rightBarButtonItem = rightButton
    }
    
    func setupFields() {
//        fullnameField.text = viewModel.title
//        designationField.text = viewModel.body
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
        onContinue?()
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
}
