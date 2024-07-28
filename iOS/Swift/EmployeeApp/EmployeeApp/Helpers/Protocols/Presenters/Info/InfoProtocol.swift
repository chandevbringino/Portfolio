//
//  InfoProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

protocol InfoProtocol {
  var message: String { get }
  var foregroundColor: UIColor { get }
  var backgroundColor: UIColor { get }
  var duration: TimeInterval { get }
  var action: InfoAction? { get }
}

extension InfoProtocol {
  var duration: TimeInterval { 3 }
  var action: InfoAction? { nil }
}
