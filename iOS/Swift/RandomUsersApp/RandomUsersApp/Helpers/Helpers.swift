//
//  Helpers.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//

import Foundation

// MARK: - Delay

func delay(_ seconds: Double, task: @escaping VoidResult) {
  let when = DispatchTime.now() + seconds
  DispatchQueue.main.asyncAfter(deadline: when, execute: task)
}
