//
//  App.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//

import UIKit
import RealmSwift

class App {
    static let shared = App()
    
    // MARK: - AppConfig
    
    private(set) var config: AppConfigProtocol!
    
    // MARK: - APIClient
    
    private(set) var apiClient: APIClient!
    
    // MARK: - Services
    
    private(set) var randomUser: RandomUserServiceProtocol!
    private(set) var networkMonitor: NetworkMonitorServiceProtocol!
    
    // MARK: - Realm
    
    private(set) var realm: Realm!
    
    func bootstrap(
      with application: UIApplication,
      launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        networkMonitor = NetworkMonitorService()
        config = AppConfig()
        apiClient = APIClient(baseUrl: config.apiUrl)
        realm = try! Realm()
        
        
        randomUser = RandomUserService(
            api: apiClient, 
            localClient: RealmRandomUserLocalClient(realm: realm)
        )
    }
}
