//
//  InfoPresenterProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

protocol InfoPresenterProtocol {
  func presentInfo(
    _ info: InfoProtocol,
    onComplete: @escaping VoidResult
  )

  func presentSuccessInfo(message: String)

  func presentSuccessInfo(
    message: String,
    onComplete: @escaping VoidResult
  )

  func presentErrorInfo(error: Error)

  func presentErrorMessage(message: String)

  func presentErrorInfo(
    error: Error,
    onComplete: @escaping VoidResult
  )
}
