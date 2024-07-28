//
//  JailBrokenDialog.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

struct JailBrokenDialog: DialogProtocol {}

extension JailBrokenDialog {
  var title: String? { S.jailBrokenTitle() }
  var message: String? { S.jailBrokenMessage() }

  var cancelOption: DialogOption? { nil }

  var positiveOption: DialogOption? { nil }

  var negativeOption: DialogOption? { nil }
}
