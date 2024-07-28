//
//  HUDProgressPresenter.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

import SVProgressHUD

class HUDProgressPresenter: ProgressPresenterProtocol {
  func presentIndefiniteProgress(
    from source: UIViewController
  ) {
    presentIndefiniteProgress(
      message: nil,
      from: source
    )
  }

  func presentIndefiniteProgress(
    message: String?,
    from source: UIViewController
  ) {
    SVProgressHUD.show(
      message: message,
      mask: .black
    )
  }

  func presentProgress(
    value: Float,
    from source: UIViewController
  ) {
    presentProgress(
      value: value,
      message: nil,
      from: source
    )
  }

  func presentProgress(
    value: Float,
    message: String?,
    from source: UIViewController
  ) {
    SVProgressHUD.showProgress(
      Float(value),
      status: message
    )
  }

  func dismiss() {
    dismiss(onComplete: DefaultClosure.voidResult())
  }

  func dismiss(
    onComplete: @escaping VoidResult
  ) {
    SVProgressHUD.dismiss(completion: onComplete)
  }
}
