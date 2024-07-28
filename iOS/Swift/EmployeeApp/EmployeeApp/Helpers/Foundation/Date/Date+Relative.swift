//
//  Date+Relative.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

extension Date {
  private static let localeData: [String: String] = [
    "year": "yr",
    "month": "mo",
    "week": "wk",
    "day": "d",
    "hour": "h",
    "minute": "m",
    "second": "s",
    "now": "now"
  ]
  
  func toPreciseRelative() -> String {
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .full
    formatter.locale = .current
    formatter.calendar = .current
    
    return formatter.localizedString(for: self, relativeTo: Date.now)
  }
  
  func toRelativeTinyDate() -> String {
    let now = Date.now
    if let nowRelativeDate = Date.localeData["now"],
       Int(self.timeIntervalSince1970) == Int(now.timeIntervalSince1970) {
      return nowRelativeDate
    }
    
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .full
    formatter.locale = .current
    formatter.calendar = .current
    
    let formattedDate = formatter.localizedString(for: self, relativeTo: Date.now)
    
    var removedUnwantedPartDate = formattedDate
    
    let dateComponents = formattedDate.split(separator: " ")
    if dateComponents.count > 2 {
      // replace unit with localeData
      var currentUnit = String(dateComponents[1])
      let localeDataKeys = Date.localeData.keys.map { String($0) }
      let localeDataValues = Date.localeData.values.map { String($0) }
      
      for (index, localeDataKey) in localeDataKeys.enumerated()
      where currentUnit.contains(localeDataKey) {
        currentUnit = localeDataValues[index]
      }
      
      // Remove 'ago' word in date string and
      removedUnwantedPartDate = dateComponents[0] + currentUnit
    }
    
    return removedUnwantedPartDate
  }
}
