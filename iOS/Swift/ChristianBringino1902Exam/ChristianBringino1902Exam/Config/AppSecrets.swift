//
//  AppSecrets.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol AppSecretsProtocol {
  var pubsubApiKey: String { get }
}

struct AppSecrets: AppSecretsProtocol {
  var pubsubApiKey: String { "70a0389a-d701-4d78-a325-e7f5da2ae9b0" }
}
