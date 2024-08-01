//
//  PDFViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 8/1/24.
//

import Foundation
import FirebaseStorage

class PDFViewModel: PDFViewModelProtocol {
    private var url: URL
    
    private let isLocalURL: Bool
    
    init(isLocalURL: Bool, url: URL) {
        self.isLocalURL = isLocalURL
        self.url = url
    }
}

// MARK: - Method

extension PDFViewModel {
    func downloadPDF(
        onSuccess: @escaping VoidResult,
        onError: @escaping ErrorResult
    ) {
        let storageRef = Storage.storage().reference(forURL: url.absoluteString)
        
        let localFile = FileManager.default
            .temporaryDirectory
            .appendingPathComponent("document.pdf")
        
        storageRef.write(toFile: localFile) { tempURL, error in
            if let error {
                return onError(error)
            }
            
            self.url = tempURL!
            onSuccess()
        }
    }
}

// MARK: - Getters

extension PDFViewModel {
    var isPDFLocal: Bool { isLocalURL }
    
    var pdfURL: URL? { url }
}
