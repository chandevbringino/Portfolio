//
//  AppDelegate.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit
import IQKeyboardManagerSwift
import FirebaseCore
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        
        App.shared.bootstrap(with: application, launchOptions: launchOptions)
        
        IQKeyboardManager.shared.enable = true
        
        presentRootVC()
        
        return true
    }
    
    func presentRootVC() {
        // TODO: - UISCreen.main will soon be deprecated. Kindly update asap.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = R.storyboard.login.loginController()!
        vc.viewModel = LoginViewModel()
        
        let vc2 = R.storyboard.posts.postsController()!
        vc2.viewModel = PostsViewModel()
        
        let isLoggedIn = Auth.auth().currentUser != nil
        
        let nc = UINavigationController(rootViewController: isLoggedIn ? vc2 : vc)
        nc.modalPresentationStyle = .fullScreen
        
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
}

