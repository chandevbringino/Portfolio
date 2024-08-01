//
//  
//  AddOrEditProfilePictureController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/31/24.
//
//

import Foundation
import UIKit
import PhotosUI
import AVFoundation

class AddOrEditProfilePictureController: ViewController {
    var viewModel: AddOrEditProfilePictureViewModelProtocol!
    var onFinish: VoidResult?
    
    @IBOutlet private(set) var imageView: UIImageView!
    @IBOutlet private(set) var finishButton: UIButton!
    @IBOutlet private(set) var imageBGView: UIView!
    @IBOutlet private(set) var pencilBGView: UIView!
}

// MARK: - Lifecycle

extension AddOrEditProfilePictureController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension AddOrEditProfilePictureController {
    func setup() {
        setupView()
        setupButtons()
    }
    
    func setupView() {
        imageView.layer.cornerRadius = imageView.bounds.width / 2
        imageBGView.layer.cornerRadius = imageBGView.bounds.width / 2
        pencilBGView.layer.cornerRadius = pencilBGView.bounds.width / 2
        pencilBGView.layer.borderWidth = 2
        pencilBGView.layer.borderColor = UIColor(
            red: 205/255,
            green: 205/255,
            blue: 205/255,
            alpha: 1
        ).cgColor
    }
    
    func setupButtons() {
        finishButton.layer.cornerRadius = 4
        finishButton.layer.borderWidth = 1
        finishButton.layer.borderColor = UIColor.darkGray.cgColor
    }
}

// MARK: - Methods

private extension AddOrEditProfilePictureController {
    // TODO: - Create generic image picker
    func presentCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    // TODO: - Create generic photo picker
    func presentPhotoPicker() {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        
        let filter = PHPickerFilter.any(of: [.images])
        config.filter = filter
        config.preferredAssetRepresentationMode = .current
        config.selection = .ordered
        config.selectionLimit = 1
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
}

// MARK: - Handlers

private extension AddOrEditProfilePictureController {
    func handleCreateEmployeeSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.onFinish?()
        }
    }
}

// MARK: - Actions

private extension AddOrEditProfilePictureController {
    @IBAction
    func addPictureButtonTapped() {
        let sheet = SelectPhotoSheet(
            onCamera: trigger(type(of: self).presentCamera),
            onGallery: trigger(type(of: self).presentPhotoPicker)
        )
        sheetPresenter.present(sheet, from: self)
    }
    
    @IBAction
    func finishButtonTapped() {
        showLoader()
        viewModel.createEmployee(
            onSuccess: handleCreateEmployeeSuccess(),
            onError: handleError()
        )
    }
}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate

extension AddOrEditProfilePictureController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        picker.dismiss(animated: true)
        
        if 
            let image = info[.editedImage] as? UIImage,
            let imageData = image.jpegData(compressionQuality: 1)
        {
            imageView.image = image
            viewModel.setImage(data: imageData)
        }
    }
}

// MARK: - PHPickerViewControllerDelegate

extension AddOrEditProfilePictureController: PHPickerViewControllerDelegate {
    func picker(
        _ picker: PHPickerViewController,
        didFinishPicking results: [PHPickerResult]
    ) {
        picker.dismiss(animated: true)
        
        guard let result = results.first else { return }
        
        result.itemProvider.loadObject(
            ofClass: UIImage.self
        ) { response, error in
            delay(0) {
                guard 
                    let image = response as? UIImage,
                    let imageData = image.jpegData(compressionQuality: 1)
                else { return }
                self.imageView.image = image
                self.viewModel.setImage(data: imageData)
            }
        }
    }
}
