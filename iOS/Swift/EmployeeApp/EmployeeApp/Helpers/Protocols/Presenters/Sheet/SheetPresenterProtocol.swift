//
//  SheetPresenterProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

protocol SheetPresenterProtocol {
  func present(
    _ sheet: SheetProtocol,
    from source: UIViewController
  )
}
