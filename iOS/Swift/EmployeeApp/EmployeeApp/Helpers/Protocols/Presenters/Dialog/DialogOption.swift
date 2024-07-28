//
//  DialogOption.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

struct DialogOption {
  let title: String
  var onSelect: VoidResult = DefaultClosure.voidResult()
  var isPreferred: Bool = false
}

// MARK: - Equatable

extension DialogOption: Equatable {
  static func == (lhs: DialogOption, rhs: DialogOption) -> Bool {
    lhs.title == rhs.title
  }
}
