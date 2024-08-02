//
//  ViewController.swift
//  UserListApp
//
//  Created by Christian Bringino on 8/2/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
}

// MARK: - Methods

private extension ViewController {
    func getUsersWithResponseDecodable() {
        // MARK: - Consume JSON using the Alamofire's .responseDecodable function
        AF.request("https://randomuser.me/api")
            .responseDecodable(of: APIResponse.self) { response in
                switch response.result {
                case .success(let responseAPI):
                    print("Response Decodable: \(responseAPI)")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
    
    func getUsersWithJSONDecoder() {
        // MARK: - Consume JSON using JSONDecoder's decode function
        AF.request("https://randomuser.me/api")
            .responseJSON { response in
                switch response.result {
                case .success(let resp):
                    guard 
                        let json = resp as? [String: Any],
                        let jsonData = try? JSONSerialization.data(
                            withJSONObject: json,
                            options: .prettyPrinted
                        ),
                        let apiResponse = try? JSONDecoder().decode(
                            APIResponse.self,
                            from: jsonData
                        )
                    else { return }
                    
                    print("Decoded by JSONDecoder: \(apiResponse)")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
}

// MARK: - Actions

private extension ViewController {
    @IBAction
    func fetchUsers() {
        getUsersWithResponseDecodable()
    }
    
    @IBAction
    func fetchUserUsingJSONDecoder() {
        getUsersWithJSONDecoder()
    }
}
