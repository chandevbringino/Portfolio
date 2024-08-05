//
//  APIClient+RandomUser.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//

import Foundation
import Alamofire

extension APIClient: RandomUserAPI {
    func fetchRandomUsers(
        page: Page,
        onSuccess: @escaping SingleResult<[UserModel]>,
        onError: @escaping ErrorResult
    ) {
        AF.request(
            baseUrl,
            parameters: page.parameters
        )
        .responseDecodable(of: APIResponse.self) { response in
                switch response.result {
                case .success(let result):
                    onSuccess(result.results)
                case .failure(let error):
                    onError(error)
                }
            }
    }
}
