//
//  TabbarCoordinator.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

class TabbarCoordinator: BaseCoordinator {
//  lazy var infoPresenter: InfoPresenterProtocol = SnackbarInfoPresenter()
  
  let windowRouter: WindowRouterProtocol

  init(windowRouter: WindowRouterProtocol) {
    self.windowRouter = windowRouter
  }
}

extension TabbarCoordinator {
  func triggerRemoveAllChildren(then callback: VoidResult? = nil) -> VoidResult {
    return { [weak self] in
      guard let self else { return }

      self.children.removeAll()
      callback?()
    }
  }
}
