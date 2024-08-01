//
//  AppDocumentPresenter.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import UIKit

class AppDocumentPresenter: AppDocumentPresenterProtocol, WebPagePresenterProtocol {
  private let config: AppConfigProtocol

  init(config: AppConfigProtocol) {
    self.config = config
  }
}

// MARK: - Methods

extension AppDocumentPresenter {
  func presentTermsOfServicePage(
    fromController controller: UIViewController
  ) {
    let metadata = WebPageMetadata(
      title: S.termsCondition(),
      urlString: "config.termsOfServiceUrl"
    )

    presentWebPage(
      withMetadata: metadata,
      fromController: controller
    )
  }

  func presentPrivacyPolicyPage(
    fromController controller: UIViewController
  ) {
    let metadata = WebPageMetadata(
      title: S.privacyPolicy(),
      urlString: "config.privacyPolicyUrl"
    )

    presentWebPage(
      withMetadata: metadata,
      fromController: controller
    )
  }
    
  func presentResumePage(
    urlString: String,
    fromController controller: UIViewController
  ) {
    let metadata = WebPageMetadata(
      title: S.resume(),
      urlString: urlString
    )
    
    presentWebPage(
      withMetadata: metadata,
      fromController: controller
    )
  }
}
