//
//  AddOrEditEmployeeViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class AddOrEditEmployeeViewModel: AddOrEditEmployeeViewModelProtocol {
    private let postsAPI: PostsAPIProtocol
    private let post: PostModel?
    
    init(
        postsAPI: PostsAPIProtocol = App.shared.postsAPI,
        post: PostModel? = nil
    ) {
        self.postsAPI = postsAPI
        self.post = post
    }
}

// MARK: - Methods

extension AddOrEditEmployeeViewModel {
    func savePost(
        title: String,
        body: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if title.isEmpty {
            return onError(AppError.mustNotBeEmpty(fieldName: "Full name"))
        } else if body.isEmpty {
            return onError(AppError.mustNotBeEmpty(fieldName: "Designation"))
        }
        
        let param = PostParams(
            title: title,
            body: body
        )
        
        if isEditPost {
            postsAPI.editPost(
                postId: post?.id ?? "",
                param: param,
                onSuccess: onSuccess,
                onError: onError
            )
        } else {
            postsAPI.createPost(
                params: param,
                onSuccess: onSuccess,
                onError: onError
            )
        }
    }
}

// MARK: - Getters

extension AddOrEditEmployeeViewModel {
    var title: String { post?.title ?? "" }
    var body: String { post?.body ?? "" }
    
    var isEditPost: Bool { post != nil }
}
