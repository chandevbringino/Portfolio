//
//  PDFViewModelProtocol.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 8/1/24.
//

import Foundation

protocol PDFViewModelProtocol {
    var isPDFLocal: Bool { get }
    var pdfURL: URL? { get }
    
    func downloadPDF(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    )
}
