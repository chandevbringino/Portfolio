//
//  PostModel.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

struct PostModel: Decodable {
    let id: String
    let title: String?
    let body: String?
    let image: String?
    let userId: String?
}
