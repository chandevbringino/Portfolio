//
//  GetUsersTests.swift
//  RandomUsersAppTests
//
//  Created by Christian Bringino on 8/5/24.
//

import Foundation
import XCTest

@testable import RandomUsersApp

class GetUsersTests: XCTestCase {
    func test_200response_decodesCorrectly() throws {
        let testBundle = Bundle(for: type(of: self))
        guard let url = testBundle.url(
            forResource: "GetUsersTests_200",
            withExtension: "json"
        ) else { return } 
        
        let data = try Data(contentsOf: url)
        let apiResponse = try JSONDecoder().decode(APIResponse.self, from: data)
        
        XCTAssertNotNil(apiResponse.results)
    }
}
