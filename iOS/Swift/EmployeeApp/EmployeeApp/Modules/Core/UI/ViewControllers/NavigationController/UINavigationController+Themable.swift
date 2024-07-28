//
//  UINavigationController+Themable.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/26/24.
//

import UIKit

extension UINavigationController: NavigationControllerThemable {
  func applyDefaultTheme() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = T.color.neutralsBackground
    appearance.largeTitleTextAttributes = [.foregroundColor: T.color.textPrimary]
    appearance.titleTextAttributes = [.foregroundColor: T.color.textPrimary]
    
    let buttonAppearance = UIBarButtonItemAppearance(style: .plain)
    buttonAppearance.normal.titleTextAttributes = [.foregroundColor: T.color.primariesDefault]
    appearance.buttonAppearance = buttonAppearance
    
    navigationBar.tintColor = T.color.primariesDefault
    navigationBar.standardAppearance = appearance
    navigationBar.scrollEdgeAppearance = appearance
  }
  
  func applyTransparentTheme() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithTransparentBackground()
    appearance.largeTitleTextAttributes = [.foregroundColor: T.color.textPrimary]
    appearance.titleTextAttributes = [.foregroundColor: T.color.textPrimary]
    
    let buttonAppearance = UIBarButtonItemAppearance(style: .plain)
    buttonAppearance.normal.titleTextAttributes = [.foregroundColor: T.color.primariesDefault]
    appearance.buttonAppearance = buttonAppearance
    
    navigationBar.standardAppearance = appearance
    navigationBar.scrollEdgeAppearance = appearance
  }
}
