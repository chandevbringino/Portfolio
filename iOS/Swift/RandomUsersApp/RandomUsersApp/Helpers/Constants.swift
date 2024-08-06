//
//  Constants.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//

import Foundation

typealias JSONDictionary = [String: Any]
typealias hasReachMaxLimit = Bool

//let S = R.string.localizable

struct Constants {
    static let maxLocalPage = 3
    static let defaultPageSize: Int = 10
    
    static let birthdateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        return formatter
    }()
    
    static let serverDateFormatter:DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        result.locale = Locale(identifier: "en_US_POSIX")
        result.timeZone = TimeZone(secondsFromGMT: 0)
        return result
    }()
}
