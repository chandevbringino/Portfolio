//
//  NavigationController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/26/24.
//

import UIKit

class NavigationController: UINavigationController {
  override init(
    navigationBarClass: AnyClass? = nil,
    toolbarClass: AnyClass? = nil
  ) {
    super.init(
      navigationBarClass: navigationBarClass,
      toolbarClass: toolbarClass
    )
    applyDefaultTheme()
  }
  
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    applyDefaultTheme()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if let controller = visibleViewController {
      return controller.supportedInterfaceOrientations
    }
    return super.supportedInterfaceOrientations
  }

  override var shouldAutorotate: Bool {
    if let controller = visibleViewController {
      return controller.shouldAutorotate
    }
    return super.shouldAutorotate
  }

  override var preferredStatusBarStyle: UIStatusBarStyle {
    if let controller = visibleViewController {
      return controller.preferredStatusBarStyle
    }
    return super.preferredStatusBarStyle
  }
}
