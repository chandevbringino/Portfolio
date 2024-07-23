//
//  UserAPI.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import Alamofire

class UserAPI: UserAPIProtocol {
    var baseURL: URL { URL(string: App.shared.config.apiUrl)! }
    
    private let config: AppConfigProtocol
    
    init(
        config: AppConfigProtocol = App.shared.config
    ) {
        self.config = config
    }
}

// MARK: - Methods

extension UserAPI {
    func registerUser(
        userParams: UserParams,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        AF.request(
            endpointURL("user/register"),
            method: .post,
            parameters: userParams.params,
            encoding: JSONEncoding.default,
            headers: getHeaders()
        ).responseJSON { response in
            switch response.result {
            case .success(let value):
                self.handleUserResponse(
                    value: value,
                    onSuccess: onSuccess,
                    onError: onError
                )
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    func loginUser(
        username: String,
        password: String,
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        let params: Parameters = [
            "username": username,
            "password": password
        ]
        
        AF.request(
            endpointURL("user/login"),
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: getHeaders()
        ).responseJSON { response in
            switch response.result {
            case .success(let value):
                self.handleUserResponse(
                    value: value,
                    onSuccess: onSuccess,
                    onError: onError
                )
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    func logoutUser(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        AF.request(
            endpointURL("user/logout"),
            method: .post,
            parameters: nil,
            encoding: JSONEncoding.default,
            headers: getHeaders(withToken: true)
        ).responseJSON { response in
            switch response.result {
            case let .success(resp):
                onSuccess()
            case let .failure(error):
                onError(error)
            }
        }
    }
}

// MARK: - Helpers

private extension UserAPI {
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

private extension UserAPI {
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
