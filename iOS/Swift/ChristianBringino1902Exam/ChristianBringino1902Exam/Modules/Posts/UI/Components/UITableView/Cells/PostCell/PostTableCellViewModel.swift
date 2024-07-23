//
//  PostTableCellViewModel.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class PostTableCellViewModel: PostTableCellViewModelProtocol {
    private let post: PostModel
    
    init(post: PostModel) {
        self.post = post
    }
}

// MARK: - Getters

extension PostTableCellViewModel {
    var imageURL: URL? { URL(string: post.image ?? "") }
    var title: String { post.title ?? "" }
    var body: String { post.body ?? "" }
}
