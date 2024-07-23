//
//  PostDetailsController.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit
import SDWebImage

class PostDetailsController: ViewController {
    var viewModel: PostDetailsViewModelProtocol!
    
    @IBOutlet private(set) var pictureImageView: UIImageView!
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var subtitleLabel: UILabel!
}

// MARK: - Lifecycle

extension PostDetailsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        refresh()
    }
}

// MARK: - Setup

private extension PostDetailsController {
    func setup() {
        pictureImageView.layer.cornerRadius = 70
    }
}

// MARK: - Refresh

private extension PostDetailsController {
    func refresh () {
        pictureImageView.sd_setImage(
            with: viewModel.imageURL,
            placeholderImage: R.image.listingImg1()
        )
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.body
    }
}

// MARK: - Actions

private extension PostDetailsController {
}

// MARK: - Handlers

private extension PostDetailsController {
    
}
