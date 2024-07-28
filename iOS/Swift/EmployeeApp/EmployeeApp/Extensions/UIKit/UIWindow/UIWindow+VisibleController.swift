//
//  UIWindow+VisibleController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import UIKit

extension UIWindow {
  var visibleViewController: UIViewController? {
    return UIWindow.visibleViewController(from: rootViewController)
  }

  static func visibleViewController(from vc: UIViewController?) -> UIViewController? {
    if let nc = vc as? UINavigationController {
      return UIWindow.visibleViewController(from: nc.visibleViewController)
    } else if let tc = vc as? UITabBarController {
      return UIWindow.visibleViewController(from: tc.selectedViewController)
    } else if let pvc = vc?.presentedViewController {
      return UIWindow.visibleViewController(from: pvc)
    } else {
      return vc
    }
  }

  static var presentableController: UIViewController? {
    let vc = UIApplication.shared.firstKeyWindow?.visibleViewController
    let controller = UIWindow.visibleViewController(from: vc)
    return controller
  }
}
