//
//  Page.swift
//  RandomUsersApp
//
//  Created by Christian Bringino on 8/3/24.
//

import Foundation
import Alamofire

struct Page: Equatable {
    var size: Int
    var page: Int
    
    init(
        size: Int,
        page: Int = 0
    ) {
        self.size = size
        self.page = page
    }
}

// MARK: - Getters

extension Page {
    var isFIrstPage: Bool {
        page == 1
    }
    
    var parameters: Parameters {
        var param = Parameters()
        
        param["results"] = size
        param["page"] = page
        
        return param
    }
}
