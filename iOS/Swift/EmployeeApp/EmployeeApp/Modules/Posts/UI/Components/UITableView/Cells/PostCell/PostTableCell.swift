//
//  PostTableCell.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit
import SDWebImage

class PostTableCell: UITableViewCell {
    var viewModel: PostTableCellViewModelProtocol! {
        didSet {
            refresh()
        }
    }
    
    @IBOutlet private(set) var pictureImageView: UIImageView!
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MARK: - Setup

private extension PostTableCell {
    func setup() {
        selectionStyle = .none
    }
}

// MARK: - Refresh

private extension PostTableCell {
    func refresh () {
        pictureImageView.sd_setImage(
            with: viewModel.imageURL,
            placeholderImage: R.image.listingImg1()
        )
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.body
    }
}
