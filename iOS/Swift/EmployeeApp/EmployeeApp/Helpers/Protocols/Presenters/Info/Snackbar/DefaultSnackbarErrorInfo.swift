//
//  DefaultSnackbarErrorInfo.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

struct DefaultSnackbarErrorInfo: InfoProtocol {
  let errorMessage: String

  init(errorMessage: String) {
    self.errorMessage = errorMessage
  }

  init(error: Error) {
    self.init(errorMessage: error.localizedDescription)
  }
}

extension DefaultSnackbarErrorInfo {
  var message: String { errorMessage }
  var foregroundColor: UIColor { .white }
  var backgroundColor: UIColor { T.color.semanticsErrorFull }
  var action: InfoAction? { .snackbarDismiss }
}
