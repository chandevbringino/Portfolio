//
//  AddOrEditPostController.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit

class AddOrEditPostController: ViewController {
    var viewModel: AddOrEditPostViewModelProtocol!
    var onSaveSuccess: VoidResult?
    
    @IBOutlet var fullnameField: UITextField!
    @IBOutlet var designationField: UITextField!
}

// MARK: - Lifecycle

extension AddOrEditPostController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension AddOrEditPostController {
    func setup() {
        setupNavBar()
        setupFields()
    }
    
    func setupNavBar() {
        title = viewModel.isEditPost ? "Edit" : "Add"
        
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

private extension AddOrEditPostController {
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

private extension AddOrEditPostController {
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

private extension AddOrEditPostController {
    func handleSavePostSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.onSaveSuccess?()
            self.dismissVC()
        }
    }
}
