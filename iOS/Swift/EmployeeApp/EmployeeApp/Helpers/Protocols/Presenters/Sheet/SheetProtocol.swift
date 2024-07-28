//
//  SheetProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

protocol SheetProtocol {
  var title: String? { get }
  var message: String? { get }
  var options: [SheetOption] { get }
}
