//
//  AppCoordinator.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import UIKit
import IOSSecuritySuite
import FirebaseAuth

final class AppCoordinator: BaseCoordinator {
  lazy var dialogPresenter: DialogPresenterProtocol = AlertDialogPresenter()
  
  private let windowRouter: WindowRouterProtocol
  
  init(
    windowRouter: WindowRouterProtocol
  ) {
    self.windowRouter = windowRouter
  }

  override func start() {
      if Auth.auth().currentUser != nil {
          startEmployeesCoordinator()
      } else {
          startLoginCoordinator()
      }
    
      delay(0.5, task: trigger(type(of: self).checkJailBroken))
  }
}

// MARK: - JailBroken Checker

private extension AppCoordinator {
  func checkJailBroken() {
    if let topVc = windowRouter.window.rootViewController,
       IOSSecuritySuite.amIJailbroken() {
      let dialog = JailBrokenDialog()
      dialogPresenter.presentDialog(dialog, from: topVc)
      return
    }
  }
}

// MARK: - Login Coordinator

extension AppCoordinator {
  func startLoginCoordinator() {
      let nc = NavigationController()
      windowRouter.setRoot(nc, animated: false)
      
      let router = NavRouter(navigationController: nc)
      let coordinator = LoginCoordinator(navRouter: router)
      
      coordinator.onLoginSuccess = triggerRemoveChild(
        coordinator,
        then: trigger(type(of: self).start)
      )
      
      startChild(coordinator)
  }
}

// MARK: - Employees Coordinator

extension AppCoordinator {
  func startEmployeesCoordinator() {
      let nc = NavigationController()
      windowRouter.setRoot(nc, animated: false)
      
      let nav = NavRouter(navigationController: nc)
      let coordinator = EmployeesCoordinator(navRouter: nav)
      
      coordinator.onLogoutSuccess = triggerRemoveChild(
        coordinator,
        then: trigger(type(of: self).start)
      )
      
      startChild(coordinator)
  }
}
