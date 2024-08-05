//
//  
//  RandomUsersViewModelProtocol.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//
//
import Foundation

protocol RandomUsersViewModelProtocol {
    var usersCount: Int { get }
    
    func clearFilter()
    func filterUsers(with text: String)
    
    func reloadUsers(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func fetchMoreUsers(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
    
    func randomUserTableCellVM(at row: Int) -> RandomUserTableCellViewModelProtocol
    func randomUserDetailsVM(at row: Int) -> RandomUserDetailsViewModelProtocol
}
