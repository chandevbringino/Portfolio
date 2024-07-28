//
//  Constants.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

typealias JSONDictionary = [String: Any]

let S = R.string.localizable

struct Constants {
    static let accessTokenKey = "access_token"
    
    struct FirestoreColumns {
        static let users = "users"
        static let employees = "employees"
    }
    
    struct Formatters {
      static let debugConsoleDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        formatter.timeZone = .utc
        return formatter
      }()
      
      static let birthdateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
      }()
    }
}
