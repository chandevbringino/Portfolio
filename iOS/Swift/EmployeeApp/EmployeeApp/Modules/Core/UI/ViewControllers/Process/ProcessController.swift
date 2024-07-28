//
//  ProcessController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/26/24.
//

import Foundation
import UIKit

class ProcessController: ViewController {
  var viewModel: (any ProcessViewModelProtocol)!
  
  init() {
    super.init(nibName: nil, bundle: nil)
    
    modalPresentationStyle = .overFullScreen
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Lifecycle

extension ProcessController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .clear
    
    if viewModel.shouldShowLoader {
//      progressPresenter.presentIndefiniteProgress(from: self)
    }
    
    viewModel.process()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    if viewModel.shouldShowLoader {
//      progressPresenter.dismiss()
    }
  }
}
