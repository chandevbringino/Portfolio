//
//  BlockUserSheet.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

struct BlockUserSheet: SheetProtocol {
  private let onReportPost: VoidResult
  private let onBlockAuthor: VoidResult
  
  init(
    onReportPost: @escaping VoidResult,
    onBlockAuthor: @escaping VoidResult
  ) {
    self.onReportPost = onReportPost
    self.onBlockAuthor = onBlockAuthor
  }
}

extension BlockUserSheet {
  var title: String? { nil }
  
  var message: String? { nil }
  
  var options: [SheetOption] {
    [
      SheetOption(
        title: S.reportPost(),
        onSelect: onReportPost
      ),
      SheetOption(
        title: S.postBlockUser(),
        onSelect: onBlockAuthor
      )
    ]
  }
}
