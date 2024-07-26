//
//  RecordsAPIProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol PostsAPIProtocol: APIClientProtocol {
    func createPost(
        params: PostParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func getPosts(
        onSuccess: @escaping SingleResult<[PostModel]>,
        onError: @escaping ErrorResult
    )
    
    func deletePost(
        postId: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func editPost(
        postId: String,
        param: PostParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
