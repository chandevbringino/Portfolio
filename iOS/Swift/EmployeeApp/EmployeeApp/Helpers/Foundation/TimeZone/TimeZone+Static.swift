//
//  TimeZone+Static.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

extension TimeZone {
  static var utc: TimeZone? { TimeZone(identifier: "UTC") }
}
