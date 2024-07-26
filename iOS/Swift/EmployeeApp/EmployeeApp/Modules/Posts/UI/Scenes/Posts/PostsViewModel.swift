//
//  PostsViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class PostsViewModel: PostsViewModelProtocol {
    private var posts: [PostModel] = []
    
    private let postsAPI: PostsAPIProtocol
    private let authService: AuthServiceProtocol
    
    init(
        postsAPI: PostsAPIProtocol = App.shared.postsAPI,
        authService: AuthServiceProtocol = App.shared.auth
    ) {
        self.postsAPI = postsAPI
        self.authService = authService
    }
}

// MARK: - Methods

extension PostsViewModel {
    func fetchPosts(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        postsAPI.getPosts(
            onSuccess: handleGetPostsSuccess(
                thenExecute: onSuccess
            ),
            onError: onError
        )
    }
    
    func signoutUser(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        authService.signoutUser(
            onSuccess: handleLogoutSuccess(thenExecute: onSuccess),
            onError: onError
        )
    }
    
    func deletePost(
        at row: Int,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        postsAPI.deletePost(
            postId: posts[row].id,
            onSuccess: onSuccess,
            onError: onError
        )
    }
    
    func postCellVM(at row: Int) -> PostTableCellViewModelProtocol {
        PostTableCellViewModel(post: posts[row])
    }
    
    func postDetailsVM(at row: Int) -> PostDetailsViewModelProtocol {
        PostDetailsViewModel(post: posts[row])
    }
    
    func editPostVM(at row: Int) -> AddOrEditPostViewModelProtocol {
        AddOrEditPostViewModel(post: posts[row])
    }
}

// MARK: - Handlers

private extension PostsViewModel {
    func handleGetPostsSuccess(
        thenExecute onCompletion: @escaping VoidResult
    ) -> SingleResult<[PostModel]> {
        { [weak self] posts in
            guard let self else { return }
            self.posts = posts
            onCompletion()
        }
    }
    
    func handleLogoutSuccess(
        thenExecute onCompletion: @escaping VoidResult
    ) -> VoidResult {
        {
            // TODO: - Delete persisted user in realmswift
            onCompletion()
        }
    }
}

// MARK: - Getters

extension PostsViewModel {
    var postsCount: Int { posts.count }
    
    var addPostVM: AddOrEditPostViewModelProtocol { AddOrEditPostViewModel() }
}
