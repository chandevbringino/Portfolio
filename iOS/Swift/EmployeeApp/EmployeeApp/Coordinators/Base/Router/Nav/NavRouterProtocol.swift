//
//  NavRouterProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

protocol NavRouterProtocol: AnyObject {
  var navigationController: UINavigationController { get }

  func setRoot(
    _ viewController: UIViewController,
    animated: Bool
  )

  func replaceLast(
    with viewController: UIViewController,
    animated: Bool
  )
  
  func replaceLast(
    with viewController: UIViewController,
    animated: Bool,
    onNavigateBack: VoidResult?
  )

  func setViewControllers(
    _ viewControllers: [UIViewController],
    animated: Bool
  )
  
  func present(
    _ viewController: UIViewController,
    animated: Bool
  )
  
  func present(
    _ viewController: UIViewController,
    animated: Bool,
    completion: @escaping VoidResult
  )

  func push(
    _ viewController: UIViewController,
    animated: Bool
  )

  func push(
    _ viewController: UIViewController,
    animated: Bool,
    onNavigateBack: VoidResult?
  )

  func popToRoot(animated: Bool)

  func popToRoot(
    animated: Bool,
    completion: @escaping VoidResult
  )

  func popToViewController(
    _ viewController: UIViewController,
    animated: Bool
  )

  func popToViewController(
    _ viewController: UIViewController,
    animated: Bool,
    completion: @escaping VoidResult
  )

  func pop(animated: Bool)

  func pop(
    animated: Bool,
    completion: @escaping VoidResult
  )

  func dismiss(animated: Bool)

  func dismiss(
    animated: Bool,
    completion: @escaping VoidResult
  )
}
