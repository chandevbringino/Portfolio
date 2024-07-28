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
//  private let session: SessionServiceProtocol
//  private let deepLinkService: DeepLinkServiceProtocol
  
  init(
    windowRouter: WindowRouterProtocol
  ) {
    self.windowRouter = windowRouter
  }

  override func start() {
      if let user = Auth.auth().currentUser {
          startDashboardCoordinator()
      } else {
          startAuthCoordinator()
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

// MARK: - Auth Coordinator

extension AppCoordinator {
  func startAuthCoordinator(shouldSkipAppIntro: Bool = false) {
//    let nc = NavigationController()
//    windowRouter.setRoot(nc, animated: false)
//
//    let navRouter = NavRouter(navigationController: nc)
//
//    let coordinator = AuthNavCoordinator(
//      shouldSkipAppIntro: shouldSkipAppIntro,
//      navRouter: navRouter
//    )
//    coordinator.onOnboardingSuccess = triggerRemoveChild(
//      coordinator,
//      then: handleAuthOnboardingSuccess()
//    )
//    coordinator.onLoginSuccess = triggerRemoveChild(
//      coordinator,
//      then: trigger(type(of: self).start)
//    )
//
//    startChild(coordinator)
  }

  func handleAuthOnboardingSuccess() -> VoidResult {
    return { [weak self] in
      guard let self else { return }
      self.start()
      self.startInAppPurchaseCoordinator()
    }
  }
}

// MARK: - Dashboard Coordinator

extension AppCoordinator {
  func startDashboardCoordinator() {
//    let coordinator = DashboardTabbarCoordinator(windowRouter: windowRouter)
//    coordinator.onLogout = triggerRemoveChild(
//      coordinator,
//      then: handleDashboardLogout()
//    )
//
//    startChild(coordinator)
  }

  func handleDashboardLogout() -> VoidResult {
    return { [weak self] in
      guard let self else { return }
      self.startAuthCoordinator(shouldSkipAppIntro: true)
    }
  }
}

// MARK: - MultiPlanInAppPurchass Coordinator

extension AppCoordinator {
  func startInAppPurchaseCoordinator() {
//    let nc = NavigationController()
//    nc.modalPresentationStyle = .fullScreen
//
//    let navRouter = NavRouter(navigationController: nc)
//
//    let coordinator = MultiPlanInAppPurchaseNavCoordinator(navRouter: navRouter)
//    coordinator.onComplete = triggerRemoveChild(coordinator)
//
//    startChild(coordinator)
//
//    windowRouter.presentInRoot(nc, animated: true)
  }
}
