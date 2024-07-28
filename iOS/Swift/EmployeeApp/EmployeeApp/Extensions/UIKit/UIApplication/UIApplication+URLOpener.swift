//
//  UIApplication+URLOpener.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import UIKit

extension UIApplication {
  func openUrl(
    _ url: URL,
    options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:],
    completionHandler completion: ((Bool) -> Void)? = nil
  ) {
    if canOpenURL(url) {
      open(url, options: options, completionHandler: completion)
    }
  }

  func openDialer(
    withPhoneNumber phoneNumber: String,
    completionHandler completion: ((Bool) -> Void)? = nil
  ) {
    guard let phoneUrl = URL(string: "tel://\(phoneNumber)") else { return }
    openUrl(phoneUrl)
  }
  
  func openMail(withEmail email: String) {
    guard let mailUrl = URL(string: "mailto:\(email)") else { return }
    openUrl(mailUrl)
  }

  func openSettings(
    options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:],
    completionHandler completion: ((Bool) -> Void)? = nil
  ) {
    guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
    openUrl(
      settingsURL,
      options: options,
      completionHandler: completion
    )
  }
}
