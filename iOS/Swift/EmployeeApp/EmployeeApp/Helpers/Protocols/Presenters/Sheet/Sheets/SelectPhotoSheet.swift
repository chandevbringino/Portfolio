//
//  SelectPhotoSheet.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 8/1/24.
//

import Foundation

struct SelectPhotoSheet: SheetProtocol {
  private let onCamera: VoidResult
  private let onGallery: VoidResult
  
  init(
    onCamera: @escaping VoidResult,
    onGallery: @escaping VoidResult
  ) {
    self.onCamera = onCamera
    self.onGallery = onGallery
  }
}

extension SelectPhotoSheet {
  var title: String? { nil }
  
  var message: String? { nil }
  
  var options: [SheetOption] {
    [
      SheetOption(
        title: S.openCamera(),
        onSelect: onCamera
      ),
      SheetOption(
        title: S.openGallery(),
        onSelect: onGallery
      )
    ]
  }
}
