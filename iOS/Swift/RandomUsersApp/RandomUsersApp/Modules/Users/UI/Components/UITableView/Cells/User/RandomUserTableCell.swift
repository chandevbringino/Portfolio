//
//  
//  RandomUserTableCell.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//
//

import Foundation
import UIKit
import Kingfisher

class RandomUserTableCell: UITableViewCell {
    var viewModel: RandomUserTableCellViewModelProtocol! {
        didSet {
            refresh()
        }
    }
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var fullnameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MARK: - Setup

private extension RandomUserTableCell {
    func setup() {
        selectionStyle = .none
        profileImageView.layer.cornerRadius = 8
    }
}

// MARK: - Refresh

private extension RandomUserTableCell {
    func refresh() {
        profileImageView.kf.setImage(with: viewModel.imageURL)
        fullnameLabel.text = viewModel.fullname
        emailLabel.text = viewModel.email
    }
}
