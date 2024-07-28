//
//  Date+Logging.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

extension Date {
  func dblog() -> String {
    return Constants.Formatters.debugConsoleDateFormatter.string(from: self)
  }
}
