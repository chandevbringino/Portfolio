//
//  NibLoadable.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/27/24.
//

import UIKit
import PureLayout

protocol NibLoadable where Self: UIView {
  var contentView: UIView! { get }
}

extension NibLoadable {
  func loadNib(named nibName: String? = nil) {
    let nib = nibName ?? String(describing: type(of: self))
    Bundle.main.loadNibNamed(nib, owner: self, options: nil)
    addSubview(contentView)
    contentView.autoPinEdgesToSuperviewEdges()
  }
}
