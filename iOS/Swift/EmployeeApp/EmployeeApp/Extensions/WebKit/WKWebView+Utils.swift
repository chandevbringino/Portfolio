//
//  WKWebView+Utils.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import UIKit
import WebKit

extension WKWebView {
  func load(_ urlString: String?) {
    guard let urlString, let url = URL(string: urlString) else { return }
    let request = URLRequest(url: url)
    load(request)
  }
}
