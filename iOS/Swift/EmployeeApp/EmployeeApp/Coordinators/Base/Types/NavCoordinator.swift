//
//  NavCoordinator.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

class NavCoordinator: BaseCoordinator {
//  lazy var infoPresenter: InfoPresenterProtocol = SnackbarInfoPresenter()
  
  let navRouter: NavRouterProtocol

  private(set) var baseVC: UIViewController?
  
  init(navRouter: NavRouterProtocol) {
    self.navRouter = navRouter
    baseVC = navRouter.navigationController.visibleViewController
  }
}

// MARK: - Helpers

extension NavCoordinator {
  func triggerPopToBaseVC(then callback: VoidResult? = nil) -> VoidResult {
    return { [weak self] in
      guard let self else { return }

      guard let baseVC = self.baseVC else {
        callback?()
        return
      }

      self.navRouter.popToViewController(
        baseVC,
        animated: true,
        completion: callback ?? {}
      )
    }
  }
  
  
  func triggerPop(then callback: VoidResult? = nil) -> VoidResult {
    return { [weak self] in
      guard let self else { return }

      self.navRouter.pop(
        animated: true,
        completion: callback ?? {}
      )
    }
  }
  
  func triggerDismiss(then callback: VoidResult? = nil) -> VoidResult {
    return { [weak self] in
      guard let self else { return }

      self.navRouter.dismiss(
        animated: true,
        completion: callback ?? {}
      )
    }
  }
}

// MARK: - Process

extension NavCoordinator {
  func startProcess<ViewModel: ProcessViewModelProtocol>(
    using viewModel: ViewModel,
    onSuccess: ViewModel.SuccessResult,
    onError: @escaping ErrorResult
  ) {
    viewModel.onSuccess = onSuccess
    viewModel.onError = onError
    
    let vc = ProcessController()
    vc.viewModel = viewModel

    navRouter.present(vc, animated: true)
  }
  
  func handleProcessSuccess(then callback: VoidResult? = nil) -> VoidResult {
    return { [weak self] in
      guard let self else { return }
      
      self.navRouter.dismiss(animated: true) {
        callback?()
      }
    }
  }
  
  func handleProcessSuccess<T>(then callback: SingleResult<T>? = nil) -> SingleResult<T> {
    return { [weak self] value in
      guard let self else { return }
      
      self.navRouter.dismiss(animated: true) {
        callback?(value)
      }
    }
  }
  
  func handleProcessError() -> ErrorResult {
    return { [weak self] error in
      guard let self else { return }
      
      self.navRouter.dismiss(animated: true) {
//        self.infoPresenter.presentErrorInfo(error: error)
      }
    }
  }
}
