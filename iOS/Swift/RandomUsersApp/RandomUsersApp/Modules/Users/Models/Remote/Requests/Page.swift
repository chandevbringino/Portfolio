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
}

extension Page {
    var parameters: Parameters {
        var param = Parameters()
        
        param["results"] = size
        param["page"] = page
        
        return param
    }
}
