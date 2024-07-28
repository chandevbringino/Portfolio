//
//  RecordsViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol RecordsViewModelProtocol {
    var postsCount: Int { get }
    
    var addPostVM: AddOrEditPostViewModelProtocol { get }
    
    func postDetailsVM(at row: Int) -> PostDetailsViewModelProtocol
    
    func postCellVM(at row: Int) -> PostTableCellViewModelProtocol
    
    func editPostVM(at row: Int) -> AddOrEditPostViewModelProtocol
     
    func fetchPosts(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func deletePost(
        at row: Int,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func signoutUser(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
