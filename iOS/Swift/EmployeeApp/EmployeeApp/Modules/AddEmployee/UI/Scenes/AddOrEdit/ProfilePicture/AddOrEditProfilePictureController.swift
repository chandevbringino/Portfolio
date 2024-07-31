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

class AddOrEditProfilePictureController: ViewController {
    var viewModel: AddOrEditProfilePictureViewModelProtocol!
    var onFinish: VoidResult?
    
    @IBOutlet private(set) var imageView: UIImageView!
    @IBOutlet var finishButton: UIButton!
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
        setupButtons()
    }
    
    func setupButtons() {
        finishButton.layer.cornerRadius = 4
        finishButton.layer.borderWidth = 1
        finishButton.layer.borderColor = UIColor.darkGray.cgColor
    }
}

// MARK: - Methods

private extension AddOrEditProfilePictureController {
}

// MARK: - Handlers

private extension AddOrEditProfilePictureController {
}

// MARK: - Actions

private extension AddOrEditProfilePictureController {
    @IBAction
    func addPictureButtonTapped() {
        // Present add by camera or by gallery
    }
    
    @IBAction
    func finishButtonTapped() {
        // TODO: - Finish
    }
}
