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
import TagListView
import StorageManager

class AddOrEditResumeAndSkillsController: ViewController {
    var viewModel: AddOrEditResumeAndSkillsViewModelProtocol!
    var onContinue: VoidResult?
    
    @IBOutlet private(set) var technicalSkillsField: UITextField!
    @IBOutlet private(set) var techSkillsTagListView: TagListView!
    @IBOutlet private(set) var personalSkillsField: UITextField!
    @IBOutlet private(set) var personalTagListView: TagListView!
    @IBOutlet private(set) var resumeLabel: UILabel!
    @IBOutlet private(set) var selectFileButton: UIButton!
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
        setupFields()
        setupButtons()
        setupTagListView()
        setupInitialValue()
    }
    
    func setupFields() {
        technicalSkillsField.delegate = self
        personalSkillsField.delegate = self
    }
    
    func setupButtons() {
        continueButton.layer.cornerRadius = 4
        continueButton.layer.borderWidth = 1
        continueButton.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    func setupTagListView() {
        techSkillsTagListView.textFont = UIFont.systemFont(ofSize: 14)
        personalTagListView.alignment = .leading
        techSkillsTagListView.delegate = self
        
        personalTagListView.textFont = UIFont.systemFont(ofSize: 14)
        personalTagListView.alignment = .leading
        personalTagListView.delegate = self
    }
    
    func setupInitialValue() {
        techSkillsTagListView.addTags(viewModel.technicalSkills)
        personalTagListView.addTags(viewModel.personalSkills)
        resumeLabel.text = viewModel.resumeText
        
        if !viewModel.resumeText.isEmpty {
            selectFileButton.setTitle(S.updateResume(), for: .normal)
        }
    }
}

// MARK: - Methods

private extension AddOrEditResumeAndSkillsController {
    func presentDocumentPicker() {
        let documentPicker = UIDocumentPickerViewController(
            forOpeningContentTypes: [.pdf, .appleArchive]
        )
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        documentPicker.modalPresentationStyle = .fullScreen
        present(documentPicker, animated: true)
    }
}

// MARK: - Handlers

private extension AddOrEditResumeAndSkillsController {
}

// MARK: - Actions

private extension AddOrEditResumeAndSkillsController {
    @IBAction
    func continueButtonTapped() {
        viewModel.cacheEmployeeDetails(
            onSuccess: trigger(\.onContinue),
            onError: handleError()
        )
    }
    
    @IBAction
    func selectFileButtonTapped() {
        presentDocumentPicker()
    }
}

// MARK: - UIDocumentPickerDelegate

extension AddOrEditResumeAndSkillsController: UIDocumentPickerDelegate {
    func documentPicker(
        _ controller: UIDocumentPickerViewController,
        didPickDocumentsAt urls: [URL]
    ) {
        guard let url = urls.first else { return }
        viewModel.setResume(url: url)
        resumeLabel.text = viewModel.resumeText
        selectFileButton.setTitle(S.updateResume(), for: .normal)
    }
}

// MARK: - UITextFieldDelegate

extension AddOrEditResumeAndSkillsController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text!
        
        if textField == technicalSkillsField {
            techSkillsTagListView.addTag(text)
            viewModel.addTechnicalSkill(skill: text)
        } else if textField == personalSkillsField {
            personalTagListView.addTag(text)
            viewModel.addPersonalSkill(skill: text)
        }
        
        textField.text = ""
        
        return true
    }
}

// MARK: - TagListViewDelegate

extension AddOrEditResumeAndSkillsController: TagListViewDelegate {
    func tagRemoveButtonPressed(
        _ title: String,
        tagView: TagView,
        sender: TagListView
    ) {
        sender.removeTag(title)
        
        if sender == techSkillsTagListView {
            viewModel.removeTechnicalSkill(skill: title)
        } else if sender == personalTagListView {
            viewModel.removePersonalSkill(skill: title)
        }
    }
}
