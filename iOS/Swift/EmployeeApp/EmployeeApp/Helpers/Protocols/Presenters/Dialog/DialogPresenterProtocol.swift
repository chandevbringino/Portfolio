//
//  DialogPresenterProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import UIKit

protocol DialogPresenterProtocol {
  func presentDialog(
    _ dialog: DialogProtocol,
    from source: UIViewController
  )
}
