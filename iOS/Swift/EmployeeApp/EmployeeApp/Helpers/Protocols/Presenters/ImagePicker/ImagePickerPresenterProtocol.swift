//
//  ImagePickerPresenterProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation
import UIKit

protocol ImagePickerPresenterProtocol {
  var onImagesPick: SingleResult<[UIImage]>? { get set }
  var onError: SingleResult<Error>? { get set }
  
  var anchorController: UIViewController? { get set }
  
  func presentPicker()
  
  func presentPicker(maxNumberOfItems: Int)
}
