//
//  AlertSheetPresenter.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

class AlertSheetPresenter: SheetPresenterProtocol {
  func present(
    _ sheet: SheetProtocol,
    from source: UIViewController
  ) {
    let alert = UIAlertController(
      title: sheet.title,
      message: sheet.message,
      preferredStyle: .actionSheet
    )

    sheet.options.forEach { option in
      let optionStyle: UIAlertAction.Style = option.isDestructive ? .destructive : .default
      
      self.addAlertAction(
        to: alert,
        from: option,
        style: optionStyle
      )
    }
    
    alert.addAction(.cancelAction())
    source.present(alert, animated: true)
  }
}

// MARK: - Utils

private extension AlertSheetPresenter {
  func addAlertAction(
    to alert: UIAlertController,
    from option: SheetOption,
    style: UIAlertAction.Style
  ) {
    let action = UIAlertAction(
      title: option.title,
      style: style,
      handler: { _ in option.onSelect() }
    )
    
    alert.addAction(action)

    if option.isPreferred {
      alert.preferredAction = action
    }
  }
}
