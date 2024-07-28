//
//  ProgressPresenterProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

protocol ProgressPresenterProtocol {
  func presentIndefiniteProgress(
    from source: UIViewController
  )

  func presentIndefiniteProgress(
    message: String?,
    from source: UIViewController
  )

  func presentProgress(
    value: Float,
    from source: UIViewController
  )

  func presentProgress(
    value: Float,
    message: String?,
    from source: UIViewController
  )

  func dismiss()

  func dismiss(
    onComplete: @escaping VoidResult
  )
}
