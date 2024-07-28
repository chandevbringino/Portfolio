//
//  WebPagePresenter.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import UIKit

protocol WebPagePresenterProtocol {
  func presentWebPage(
    withMetadata metadata: WebPageMetadata,
    fromController controller: UIViewController
  )
}

// MARK: - Defaults

extension WebPagePresenterProtocol {
  func presentWebPage(
    withMetadata metadata: WebPageMetadata,
    fromController controller: UIViewController
  ) {
    let wvc = WebViewController()
    wvc.title = metadata.title
    wvc.urlString = metadata.urlString

    let nc = NavigationController(rootViewController: wvc)
    controller.present(nc, animated: true)
  }
}

// MARK: - Types

typealias WebPageMetadata = (
  title: String,
  urlString: String
)
