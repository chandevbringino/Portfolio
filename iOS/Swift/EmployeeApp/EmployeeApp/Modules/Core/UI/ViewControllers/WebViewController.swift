//
//  WebViewController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import UIKit
import WebKit

/// A `WebViewController` utilizing `WKWebView` component. Not `UIWebView`.
///
/// Other features of this controller are:
/// - Includes a 2pt-size progress bar that's attached right below the navbar.
/// - Autoupdates the navbar's title with the loaded content's document title.
///
/// Example usage:
///
///     func presentTermsAndConditions() {
///       let page = WebViewController()
///       page.title = "Terms & Conditions"
///       page.urlString = "http://159.89.203.124/terms-conditions"
///       self.present(NavigationController(rootViewController: page), animated: true, completion: nil)
///     }
///
class WebViewController: ViewController, WKUIDelegate {
  var webView: WKWebView!
  weak var progressView: UIProgressView!

  var urlString: String? {
    didSet {
      guard let urlString, isViewLoaded else { return }
      webView.load(urlString)
    }
  }

  private var kvo: [NSKeyValueObservation] = []

  override func loadView() {
    let webConfiguration = WKWebViewConfiguration()
    webView = WKWebView(frame: .zero, configuration: webConfiguration)
    webView.uiDelegate = self
    webView.navigationDelegate = self
    view = webView

    setupProgressView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    webView.load(urlString)

    kvo.append(webView.observe(\.title) { [weak self] aWebView, _ in
      guard self?.title == nil else { return }
      self?.navigationItem.title = aWebView.title
    })
    kvo.append(webView.observe(\.estimatedProgress) { [weak self] aWebView, _ in
      guard let self else { return }
      let progress = Float(aWebView.estimatedProgress)
      self.progressView.progress = progress
      UIView.animate(withDuration: 0.25, delay: 0.5, options: [], animations: {
        self.progressView.alpha = progress >= 1 ? 0 : 1
      })
    })
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }

  func setupProgressView() {
    let progressView = UIProgressView(progressViewStyle: .default)
    progressView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
    progressView.tintColor = T.color.primariesDefault
    navigationController?.navigationBar.addSubview(progressView)

    let navigationBarBounds = navigationController?.navigationBar.bounds
    progressView.frame = CGRect(
      x: 0,
      y: navigationBarBounds!.size.height - 2,
      width: navigationBarBounds!.size.width,
      height: 2
    )
    self.progressView = progressView
  }
}

// MARK: - WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {
  func webView(
    _ webView: WKWebView,
    decidePolicyFor navigationAction: WKNavigationAction,
    decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
  ) {
    if navigationAction.request.url != nil {
      decisionHandler(.cancel)
    }
  }

  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    progressView.isHidden = true
  }

  func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    progressView.isHidden = false
  }
    
  func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: any Error) {
    print("Webview Error: \(error.localizedDescription)")
  }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: any Error) {
        print("Webview Error: \(error.localizedDescription)")
    }
}
