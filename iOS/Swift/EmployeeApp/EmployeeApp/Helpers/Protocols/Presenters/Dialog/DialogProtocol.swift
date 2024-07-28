//
//  DialogProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol DialogProtocol {
  var title: String? { get }
  var message: String? { get }
  var cancelOption: DialogOption? { get }
  var positiveOption: DialogOption? { get }
  var negativeOption: DialogOption? { get }
}
