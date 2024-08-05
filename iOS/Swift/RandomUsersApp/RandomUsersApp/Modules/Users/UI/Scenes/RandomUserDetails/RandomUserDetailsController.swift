//
//  
//  RandomUserDetailsController.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//
//

import Foundation
import UIKit

class RandomUserDetailsController: ViewController {
    var viewModel: RandomUserDetailsViewModelProtocol!
    var onSetTitle: SingleResult<String>?
    
    @IBOutlet private(set) var profileBGView: UIView!
    @IBOutlet private(set) var profileImageView: UIImageView!
    @IBOutlet private(set) var firstnameLabel: UILabel!
    @IBOutlet private(set) var lastnameLabel: UILabel!
    @IBOutlet private(set) var birthdayLabel: UILabel!
    @IBOutlet private(set) var ageLabel: UILabel!
    @IBOutlet private(set) var emailLabel: UILabel!
    @IBOutlet private(set) var mobileLabel: UILabel!
    @IBOutlet private(set) var addressLabel: UILabel!
}

// MARK: - Lifecycle

extension RandomUserDetailsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension RandomUserDetailsController {
    func setup() {
        setupImageView()
        
        refresh()
    }
    
    func setupImageView() {
        profileBGView.layer.cornerRadius = profileBGView.bounds.width / 2
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
    }
}

// MARK: - Refresh

private extension RandomUserDetailsController {
    func refresh() {
        profileImageView.kf.setImage(with: viewModel.imageURL)
        firstnameLabel.text = viewModel.firstname
        lastnameLabel.text = viewModel.lastname
        birthdayLabel.text = viewModel.birthday
        ageLabel.text = viewModel.age
        emailLabel.text = viewModel.email
        mobileLabel.text = viewModel.mobileNumber
        addressLabel.text = viewModel.address
    }
}

// MARK: - Actions

private extension RandomUserDetailsController {
    @IBAction
    func imageButtonTapped() {
        onSetTitle?(viewModel.fullname)
        navigationController?.popViewController(animated: true)
    }
}
