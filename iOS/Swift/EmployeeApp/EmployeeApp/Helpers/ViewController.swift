//
//  ViewController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    lazy var progressPresenter: ProgressPresenterProtocol = HUDProgressPresenter()
    lazy var dialogPresenter: DialogPresenterProtocol = AlertDialogPresenter()
    lazy var sheetPresenter: SheetPresenterProtocol = AlertSheetPresenter()
    lazy var infoPresenter: InfoPresenterProtocol = SnackbarInfoPresenter()
    
    var isPresentedModally: Bool {
      return presentingViewController != nil ||
        navigationController?.presentingViewController?.presentedViewController === navigationController ||
        tabBarController?.presentingViewController is UITabBarController
    }
    
    enum CloseButtonPosition {
      case left
      case right
    }
    
    var preferredCloseButtonPosition: CloseButtonPosition {
      return .left
    }
    
    var shouldSetNavBarTransparent: Bool {
      return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarItems()
    }
    
    func setupNavBarItems() {
      if navigationController?.viewControllers.first != self {
        let backButton = UIBarButtonItem(
          image: R.image.icBack(),
          style: .plain,
          target: self,
          action: #selector(backButtonTapped)
        )
          
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
          
      } else if isPresentedModally {
        let button = UIBarButtonItem(
          image: R.image.icBack(),
          style: .plain,
          target: self,
          action: #selector(backButtonTapped)
        )
        if preferredCloseButtonPosition == .left {
          navigationItem.leftBarButtonItem = button
        } else {
          navigationItem.rightBarButtonItem = button
        }
      }
    }
    
    @objc
    func backButtonTapped() {
      if navigationController?.viewControllers.first != self {
        navigationController?.popViewController(animated: true)
      } else if isPresentedModally {
        dismiss(animated: true, completion: nil)
      }
    }
    
    func showLoader() {
        SVProgressHUD.show()
    }
    
    func dismissLoader() {
        SVProgressHUD.dismiss()
    }
    
    func handleError() -> ErrorResult {
        { [weak self] error in
            guard let self else { return }
            self.dismissLoader()
            self.showAlert("Error", error.localizedDescription)
        }
    }
    
    func showAlert(
        _ title: String?,
        _ message: String?
    ) {
        let alert = UIAlertController(
            title: title
            , message: message,
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .cancel
            )
        )
        present(alert, animated: true)
    }
}
