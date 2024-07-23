//
//  PostParams.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation
import Alamofire

struct PostParams {
    var title: String?
    var body: String?
}

// MARK: - Getters

extension PostParams {
    var params: Parameters {
        var params = Parameters()
        
        if let title {
            params["title"] = title
        }
        
        if let body {
            params["body"] = body
        }
        
        return params
    }
}
