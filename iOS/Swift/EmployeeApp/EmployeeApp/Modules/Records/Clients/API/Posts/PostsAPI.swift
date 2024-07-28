//
//  PostsAPI.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import Alamofire

class PostsAPI: PostsAPIProtocol {
    var baseURL: URL { URL(string: App.shared.config.apiUrl)! }
    
    private let config: AppConfigProtocol
    
    init(
        config: AppConfigProtocol = App.shared.config
    ) {
        self.config = config
    }
}

// MARK: - Methods

extension PostsAPI {
    func createPost(
        params: PostParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        AF.request(
            endpointURL("post"),
            method: .post,
            parameters: params.params,
            encoding: JSONEncoding.default,
            headers: getHeaders(withToken: true)
        ).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let JSON = value as? [String: Any] {
                    let status = JSON["status"] as? String ?? ""
                    let message = JSON["message"] as? String ?? ""
                    
                    if status.isEmpty {
                        onSuccess()
                    } else {
                        onError(AppError.error(reason: message))
                    }
                } else {
                    onError(AppError.error(reason: "Cannot find JSON"))
                }
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    func getPosts(
        onSuccess: @escaping SingleResult<[PostModel]>,
        onError: @escaping ErrorResult
    ) {
        AF.request(
            endpointURL("post"),
            method: .get,
            headers: getHeaders(withToken: true)
        ).responseDecodable(of: [PostModel].self) { response in
            switch response.result {
            case .success(let value):
                onSuccess(value)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    func deletePost(
        postId: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        AF.request(
            endpointURL("post/\(postId)"),
            method: .delete,
            headers: getHeaders(withToken: true)
        ).responseJSON { response in
            switch response.result {
            case .success(let value): 
                if let JSON = value as? [String: Any] {
                    let status = JSON["status"] as? String ?? ""
                    let message = JSON["message"] as? String ?? ""
                    
                    if status.isEmpty {
                        onSuccess()
                    } else {
                        onError(AppError.error(reason: message))
                    }
                } else {
                    onError(AppError.error(reason: "Cannot find JSON"))
                }
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    func editPost(
        postId: String,
        param: PostParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        AF.request(
            endpointURL("post/\(postId)"),
            method: .put,
            parameters: param.params,
            encoding: JSONEncoding.default,
            headers: getHeaders(withToken: true)
        ).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let JSON = value as? [String: Any] {
                    let status = JSON["status"] as? String ?? ""
                    let message = JSON["message"] as? String ?? ""
                    
                    if status.isEmpty {
                        onSuccess()
                    } else {
                        onError(AppError.error(reason: message))
                    }
                } else {
                    onError(AppError.error(reason: "Cannot find JSON"))
                }
            case .failure(let error):
                onError(error)
            }
        }
    }
}

// MARK: - Helpers

private extension PostsAPI {
    private func getHeaders(withToken: Bool = false) -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers["Secret"] = config.secrets.pubsubApiKey
        headers["Content-Type"] = "application/json"
        
        if withToken {
            headers["TOKEN"] = UserDefaults.standard.string(
                forKey: Constants.accessTokenKey
            )
        }
        
        return headers
    }
}

// MARK: - Handlers

private extension PostsAPI {
    func handleUserResponse(
        value: Any,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        if let JSON = value as? [String: Any] {
            let status = JSON["status"] as? String ?? ""
            let message = JSON["message"] as? String ?? ""
            
            if status.isEmpty, let accessToken = JSON["token"] as? String {
                UserDefaults.standard.setValue(
                    accessToken,
                    forKey: Constants.accessTokenKey
                )
                onSuccess()
            } else {
                onError(AppError.error(reason: message))
            }
        } else {
            onError(AppError.error(reason: "Cannot find JSON"))
        }
    }
}
