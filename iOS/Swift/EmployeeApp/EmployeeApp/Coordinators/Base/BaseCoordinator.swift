//
//  BaseCoordinator.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

class BaseCoordinator: CoordinatorProtocol, TriggerableProtocol {
  var children: [CoordinatorProtocol] = []

  func start() {
    fatalError("Children should implement `start`.")
  }

  func startChild(_ child: CoordinatorProtocol) {
    children.append(child)
    child.start()
  }

  func removeChild(_ child: CoordinatorProtocol) {
    if !child.children.isEmpty {
      debugPrint("WARNING: Tried removing \(String(describing: child)) with non-empty children: \(child.children)")
    }

    children = children.filter { $0 !== child }
  }

  func triggerRemoveChild(
    _ child: CoordinatorProtocol,
    then callback: VoidResult? = nil
  ) -> VoidResult {
    return { [weak self, weak child] in
      guard
        let self = self,
        let child = child
      else { return }

      self.removeChild(child)
      callback?()
    }
  }
}
