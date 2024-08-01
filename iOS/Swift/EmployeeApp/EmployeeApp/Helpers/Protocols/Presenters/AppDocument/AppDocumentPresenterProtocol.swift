//
//  AppDocumentPresenterProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import UIKit

protocol AppDocumentPresenterProtocol {
  func presentTermsOfServicePage(
    fromController controller: UIViewController
  )
  
  func presentPrivacyPolicyPage(
    fromController controller: UIViewController
  )
    
  func presentResumePage(
    urlString: String,
    fromController controller: UIViewController
  )
}
