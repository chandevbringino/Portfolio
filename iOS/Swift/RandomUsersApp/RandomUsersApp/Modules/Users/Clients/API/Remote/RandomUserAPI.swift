//
//  RandomUserAPI.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//

import Foundation

protocol RandomUserAPI {
    func fetchRandomUsers(
        page: Page,
        onSuccess: @escaping SingleResult<[UserModel]>,
        onError: @escaping ErrorResult
    )
}
