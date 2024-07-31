//
//  EmployeeDetailsController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit
import SDWebImage

class EmployeeDetailsController: ViewController {
    var viewModel: EmployeeDetailsViewModelProtocol!
    var onNavigateToSkills: SingleResult<IsTechnicalSkill>?
    
    @IBOutlet private(set) var pictureImageView: UIImageView!
    @IBOutlet private(set) var fullnameLabel: UILabel!
    @IBOutlet private(set) var roleLabel: UILabel!
    @IBOutlet private(set) var emailLabel: UILabel!
    @IBOutlet private(set) var contactLabel: UILabel!
    @IBOutlet private(set) var genderLabel: UILabel!
    @IBOutlet private(set) var birthdayLabel: UILabel!
    @IBOutlet private(set) var startDateLabel: UILabel!
    @IBOutlet private(set) var endDateLabel: UILabel!
    @IBOutlet private(set) var reasonForLeavingLabel: UILabel!
}

// MARK: - Lifecycle

extension EmployeeDetailsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        refresh()
    }
}

// MARK: - Setup

private extension EmployeeDetailsController {
    func setup() {
        pictureImageView.layer.cornerRadius = 70
    }
}

// MARK: - Refresh

private extension EmployeeDetailsController {
    func refresh () {
        pictureImageView.sd_setImage(
            with: viewModel.imageURL,
            placeholderImage: R.image.listingImg1()
        )
        fullnameLabel.text = viewModel.fullname
        roleLabel.text = viewModel.role
        emailLabel.text = viewModel.email
        contactLabel.text = viewModel.contact
        genderLabel.text = viewModel.gender
        birthdayLabel.text = viewModel.birthday
        startDateLabel.text = viewModel.startDateText
        endDateLabel.text = viewModel.endDateText
        reasonForLeavingLabel.text = viewModel.reasonForLeaving
    }
}

// MARK: - Actions

private extension EmployeeDetailsController {
    @IBAction
    func showPersonalSkills() {
        onNavigateToSkills?(false)
    }
    
    @IBAction
    func showTechnicalSkills() {
        onNavigateToSkills?(true)
    }
}

// MARK: - Handlers

private extension EmployeeDetailsController {
    
}
