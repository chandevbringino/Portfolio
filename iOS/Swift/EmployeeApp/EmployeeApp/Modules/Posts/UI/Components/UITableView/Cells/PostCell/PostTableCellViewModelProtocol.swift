//
//  PostTableCellViewModelProtocol.swift
//  ChristianBringino1902Exam
//
//  Created by Christian Bringino on 7/23/24.
//

import Foundation

protocol PostTableCellViewModelProtocol {
    var imageURL: URL? { get }
    var title: String { get }
    var body: String { get }
}
