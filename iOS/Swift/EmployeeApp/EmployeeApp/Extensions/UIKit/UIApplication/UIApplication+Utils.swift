//
//  UIApplication+Utils.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import UIKit

extension UIApplication {
  var firstKeyWindow: UIWindow? { windows.first { $0.isKeyWindow } }
  
  static var bundleIdentifier: String? {
    return Bundle.main.bundleIdentifier
  }

  static var isRunningTests: Bool {
    return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
  }
}
