//
//  
//  EmployeeCollectionCell.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/30/24.
//
//

import Foundation
import UIKit
import SDWebImage

class EmployeeCollectionCell: UICollectionViewCell {
    var viewModel: EmployeeCollectionCellViewModelProtocol!  {
        didSet {
            refresh()
        }
    }
    
    @IBOutlet private(set) var mainContentView: UIView!
    @IBOutlet private(set) var imageView: UIImageView!
    @IBOutlet private(set) var nameLabel: UILabel!
    @IBOutlet private(set) var roleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MARK: - Setup

private extension EmployeeCollectionCell {
    func setup() {
        mainContentView.layer.cornerRadius = 8
        mainContentView.layer.borderColor = UIColor.black.cgColor
        mainContentView.layer.borderWidth = 1
        
        imageView.layer.cornerRadius = 8
    }
}

// MARK: - Refresh

private extension EmployeeCollectionCell {
    func refresh() {
        imageView.sd_setImage(with: viewModel.imageURL)
        nameLabel.text = viewModel.name
        roleLabel.text = viewModel.role
    }
}

// MARK: - Actions

private extension EmployeeCollectionCell {
}
