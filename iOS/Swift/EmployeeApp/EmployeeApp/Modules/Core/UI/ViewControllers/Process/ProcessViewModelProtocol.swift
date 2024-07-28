//
//  ProcessViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/26/24.
//

import Foundation

protocol ProcessViewModelProtocol: TriggerableProtocol {
  associatedtype SuccessResult
  
  var onSuccess: SuccessResult? { get set }
  var onError: ErrorResult? { get set }
  
  var shouldShowLoader: Bool { get }
  
  func process()
}
