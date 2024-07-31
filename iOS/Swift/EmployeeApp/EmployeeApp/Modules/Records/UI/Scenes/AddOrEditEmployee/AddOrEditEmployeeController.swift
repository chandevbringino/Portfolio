//
//  AddOrEditEmployeeController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit

class AddOrEditEmployeeController: ViewController {
    var viewModel: AddOrEditEmployeeViewModelProtocol!
    var onSaveSuccess: VoidResult?
    
    @IBOutlet var fullnameField: UITextField!
    @IBOutlet var designationField: UITextField!
}

// MARK: - Lifecycle

extension AddOrEditEmployeeController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension AddOrEditEmployeeController {
    func setup() {
        setupNavBar()
        setupFields()
    }
    
    func setupNavBar() {
        title = viewModel.isEditPost ? S.edit() : S.add()
        
        let leftButton = UIBarButtonItem(
            title: "Cancel",
            style: .plain,
            target: self,
            action: #selector(dismissVC)
        )
        
        let rightButton = UIBarButtonItem(
            title: "Save",
            style: .plain,
            target: self,
            action: #selector(saveButtonTapped)
        )
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
    }
    
    func setupFields() {
        fullnameField.text = viewModel.title
        designationField.text = viewModel.body
    }
}

// MARK: - Methods

private extension AddOrEditEmployeeController {
    func savePost() {
        showLoader()
        viewModel.savePost(
            title: fullnameField.text!,
            body: designationField.text!,
            onSuccess: handleSavePostSuccess(),
            onError: handleError()
        )
    }
}

// MARK: - Actions

private extension AddOrEditEmployeeController {
    @objc
    func saveButtonTapped() {
        savePost()
    }
    
    @objc
    func dismissVC() {
        dismiss(animated: true)
    }
}

// MARK: - Handlers

private extension AddOrEditEmployeeController {
    func handleSavePostSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.onSaveSuccess?()
            self.dismissVC()
        }
    }
}
