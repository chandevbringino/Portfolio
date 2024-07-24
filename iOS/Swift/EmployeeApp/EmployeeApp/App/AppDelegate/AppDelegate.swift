//
//  AppDelegate.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        App.shared.bootstrap(with: application, launchOptions: launchOptions)
        
        IQKeyboardManager.shared.enable = true
        
        // UISCreen.main soon to be deprecated. Kindly update asap.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = R.storyboard.login.loginController()!
        vc.viewModel = LoginViewModel()
        
        let vc2 = R.storyboard.posts.postsController()!
        vc2.viewModel = PostsViewModel()
        
        let token = UserDefaults.standard.string(forKey: Constants.accessTokenKey) ?? ""
        let isLoggedIn = !token.isEmpty
        
        let nc = UINavigationController(rootViewController: isLoggedIn ? vc2 : vc)
        nc.modalPresentationStyle = .fullScreen

        
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        
        return true
    }
}

