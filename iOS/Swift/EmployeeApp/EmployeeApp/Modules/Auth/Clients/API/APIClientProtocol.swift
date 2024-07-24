//
//  APIClientProtocol.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol APIClientProtocol {
    var baseURL: URL { get }
}

extension APIClientProtocol {
    func endpointURL(_ resourcePath: String) -> URL {
        baseURL.appendingPathComponent("/\(resourcePath)")
    }
}
