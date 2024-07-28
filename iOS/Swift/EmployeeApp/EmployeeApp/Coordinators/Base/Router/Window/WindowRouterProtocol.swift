//
//  WindowRouterProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

protocol WindowRouterProtocol: AnyObject {
  var window: UIWindow { get }

  func setRoot(
    _ viewController: UIViewController,
    animated: Bool
  )

  func setRoot(
    _ viewController: UIViewController,
    animated: Bool,
    completion: @escaping VoidResult
  )

  func presentInRoot(
    _ viewController: UIViewController,
    animated: Bool
  )
  
  func dismiss(animated: Bool)

  func dismiss(
    animated: Bool,
    completion: @escaping VoidResult
  )
}
