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
    func presentCamera() {
        guard let photoOutput = self.photoOutput else { return }
                delay(0) {
                
                    var photoSettings = AVCapturePhotoSettings()


                    if photoOutput.availablePhotoCodecTypes.contains(.hevc) {
                        photoSettings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.hevc])
                    }
                    
                    let isFlashAvailable = self.deviceInput?.device.isFlashAvailable ?? false
                    photoSettings.flashMode = isFlashAvailable ? .auto : .off
                    photoSettings.isHighResolutionPhotoEnabled = true
                    if let previewPhotoPixelFormatType = photoSettings.availablePreviewPhotoPixelFormatTypes.first {
                        photoSettings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPhotoPixelFormatType]
                    }
                    photoSettings.photoQualityPrioritization = .balanced
                    
                    if let photoOutputVideoConnection = photoOutput.connection(with: .video) {
                        if photoOutputVideoConnection.isVideoOrientationSupported,
                            let videoOrientation = self.videoOrientationFor(self.deviceOrientation) {
                            photoOutputVideoConnection.videoOrientation = videoOrientation
                        }
                    }
                    
                    photoOutput.capturePhoto(with: photoSettings, delegate: self)
                }
    }
    
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
        onFinish?()
    }
}

// MARK: - AVCapturePhotoCaptureDelegate

extension AddOrEditProfilePictureController: AVCapturePhotoCaptureDelegate {
    
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
