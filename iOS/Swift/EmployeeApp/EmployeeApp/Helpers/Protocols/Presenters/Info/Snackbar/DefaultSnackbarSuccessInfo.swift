//
//  DefaultSnackbarSuccessInfo.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

struct DefaultSnackbarSuccessInfo: InfoProtocol {
  let message: String
}

extension DefaultSnackbarSuccessInfo {
  var foregroundColor: UIColor { .white }
  var backgroundColor: UIColor { T.color.primariesDefault }
  var action: InfoAction? { .snackbarDismiss }
}
