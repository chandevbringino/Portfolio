//
//  Theme+TextStyle.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/26/24.
//

// swiftlint:disable type_name

import UIKit

extension Theme.textStyle {
  static let largeTitle: UIFont = T.font.boldSecondary(ofSize: 34)
  static let title1: UIFont = T.font.boldSecondary(ofSize: 28)
  static let title2: UIFont = T.font.boldSecondary(ofSize: 22)
  static let title3: UIFont = T.font.semiBoldSecondary(ofSize: 20)
  static let headline: UIFont = T.font.semibold(ofSize: 17)
  static let body: UIFont = T.font.regular(ofSize: 17)
  static let bodyMedium: UIFont = T.font.medium(ofSize: 17)
  static let callout: UIFont = T.font.regular(ofSize: 16)
  static let subHeadline: UIFont = T.font.regular(ofSize: 15)
  static let subHeadlineMedium: UIFont = T.font.medium(ofSize: 15)
  static let footnote: UIFont = T.font.regular(ofSize: 13)
  static let footnoteBold: UIFont = T.font.semibold(ofSize: 13)
  static let caption: UIFont = T.font.regular(ofSize: 11)
  static let captionSemibold: UIFont = T.font.semibold(ofSize: 11)
  static let navigationLabel: UIFont = T.font.regular(ofSize: 10)

  struct form {}
}

// MARK: - Form

extension Theme.textStyle.form {
  static let button: UIFont = T.font.semibold(ofSize: 17)
  static let textInput: UIFont = T.font.regular(ofSize: 17)
}

// swiftlint: enable type_name
