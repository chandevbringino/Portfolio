//
//  InfoAction+Snackbar.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

import MaterialComponents.MaterialSnackbar

extension InfoAction {
  private static let dismiss: VoidResult = {
    MDCSnackbarManager.default.dismissAndCallCompletionBlocks(withCategory: nil)
  }

  static var snackbarDismiss: InfoAction { .init(title: S.hide(), onSelect: dismiss) }
}
