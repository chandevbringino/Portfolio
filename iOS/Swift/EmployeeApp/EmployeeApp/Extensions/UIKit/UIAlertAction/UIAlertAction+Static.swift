//
//  UIAlertAction+Static.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

extension UIAlertAction {
  static func cancelAction(with title: String = S.cancel()) -> UIAlertAction {
    UIAlertAction(
      title: title,
      style: .cancel
    )
  }
}
