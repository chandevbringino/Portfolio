//
//  BlockAuthorDialog.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

struct BlockAuthorDialog: DialogProtocol {
  private let onBlock: VoidResult

  init(onBlock: @escaping VoidResult) {
    self.onBlock = onBlock
  }
}

extension BlockAuthorDialog {
  var title: String? { S.postBlockUserDialogTitle() }
  var message: String? { S.postBlockUserDialogMessage() }
  
  var cancelOption: DialogOption? {
    DialogOption(
      title: S.cancel(),
      isPreferred: true
    )
  }
  
  var positiveOption: DialogOption? {
    DialogOption(
      title: S.postBlock(),
      onSelect: onBlock
    )
  }
  
  var negativeOption: DialogOption? { nil }
}
