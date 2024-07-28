//
//  Helpers.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/28/24.
//

import Foundation

// MARK: - Logging

func debugLog(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
  #if DEBUG
    let fileURL = NSURL(fileURLWithPath: file)
    let fileName = fileURL.deletingPathExtension?.lastPathComponent ?? ""
    print("\(Date().dblog()) \(fileName)::\(function)[L:\(line)] \(message)")
  #endif
  // Nothing to do if not debugging
}

// MARK: - File Management

func jsonDictionaryFromFile(_ name: String, bundle: Bundle = Bundle.main) throws -> JSONDictionary? {
  let path = bundle.path(forResource: name, ofType: "json")!
  guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return nil }
  let options = JSONSerialization.ReadingOptions.mutableContainers
  return try JSONSerialization.jsonObject(with: data, options: options) as? JSONDictionary
}

// MARK: - Delay

func delay(_ seconds: Double, task: @escaping VoidResult) {
  let when = DispatchTime.now() + seconds
  DispatchQueue.main.asyncAfter(deadline: when, execute: task)
}
