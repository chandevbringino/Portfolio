//
//  PostDetailsViewModel.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class PostDetailsViewModel: PostDetailsViewModelProtocol {
    private let post: PostModel
    
    init(post: PostModel) {
        self.post = post
    }
}

// MARK: - Getters

extension PostDetailsViewModel {
    var imageURL: URL? { URL(string: post.image ?? "") }
    var title: String { post.title ?? "" }
    var body: String { post.body ?? "" }
}
