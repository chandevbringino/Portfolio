//
//  CoordinatorProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
  var children: [CoordinatorProtocol] { get set }

  func start()
}
