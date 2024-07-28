//
//  SheetOption.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

struct SheetOption {
  let title: String
  
  var onSelect: VoidResult = DefaultClosure.voidResult()
  var isDestructive: Bool = false
  var isPreferred: Bool = false
}

// MARK: - Equatable

extension SheetOption: Equatable {
  static func == (lhs: SheetOption, rhs: SheetOption) -> Bool {
    lhs.title == rhs.title
  }
}
