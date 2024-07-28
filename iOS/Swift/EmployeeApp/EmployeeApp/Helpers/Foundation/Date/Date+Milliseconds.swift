//
//  Date+Milliseconds.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

extension Date {
  /// Returns a Unix timestamp in milliseconds.
  func millisecondsSince1970() -> Double {
    return (timeIntervalSince1970 * 1000).rounded()
  }

  /// Creates a Date instance from a milliseconds value.
  init(millisecondsSince1970: Double) {
    self.init(timeIntervalSince1970: millisecondsSince1970 / 1000)
  }
}
