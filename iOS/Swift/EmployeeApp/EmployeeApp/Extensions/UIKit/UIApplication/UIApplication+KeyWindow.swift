//
//  UIApplication+KeyWindow.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

extension UIApplication {
  var multisceneKeyWindow: UIWindow? {
    windows.filter { $0.isKeyWindow }.first
  }
}
