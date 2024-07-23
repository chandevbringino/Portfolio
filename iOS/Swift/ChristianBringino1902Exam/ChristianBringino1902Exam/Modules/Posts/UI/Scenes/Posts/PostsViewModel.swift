//
//  PostsViewModel.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

class PostsViewModel: PostsViewModelProtocol {
    private var posts: [PostModel] = []
    
    private let postsAPI: PostsAPIProtocol
    private let userAPI: UserAPIProtocol
    
    init(
        postsAPI: PostsAPIProtocol = App.shared.postsAPI,
        userAPI: UserAPIProtocol = App.shared.userAPI
    ) {
        self.postsAPI = postsAPI
        self.userAPI = userAPI
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
        userAPI.logoutUser(
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
            UserDefaults.standard.setValue(
                nil,
                forKey: Constants.accessTokenKey
            )
            onCompletion()
        }
    }
}

// MARK: - Getters

extension PostsViewModel {
    var postsCount: Int { posts.count }
    
    var addPostVM: AddOrEditPostViewModelProtocol { AddOrEditPostViewModel() }
}
