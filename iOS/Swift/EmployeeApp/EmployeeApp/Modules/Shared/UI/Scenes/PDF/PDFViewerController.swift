//
//  
//  PDFViewerController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 8/1/24.
//
//

import Foundation
import UIKit
import WebKit
import PDFKit
import FirebaseStorage

class PDFViewerController: ViewController {
    var viewModel: PDFViewModelProtocol!
    
    @IBOutlet private(set) var pdfView: PDFView!
}

// MARK: - Lifecycle

extension PDFViewerController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension PDFViewerController {
    func setup() {
        if viewModel.isPDFLocal,
           let url = viewModel.pdfURL,
           url.startAccessingSecurityScopedResource()
        {
            displayPDF()
            
            url.stopAccessingSecurityScopedResource()
        } else {
            downloadPDF()
        }
    }
}

// MARK: - Methods

private extension PDFViewerController {
    func displayPDF() {
        guard
            let url = viewModel.pdfURL,
            let pdfDoc = PDFDocument(url: url)
        else {
            print("PDF not found")
            return
        }
        
        pdfView.document = pdfDoc
        pdfView.autoScales = true
    }
    
    func downloadPDF() {
        showLoader()
        viewModel.downloadPDF(
            onSuccess: handleDownloadPDFSuccess(),
            onError: handleError()
        )
    }
}

// MARK: - Handlers

private extension PDFViewerController {
    func handleDownloadPDFSuccess() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.dismissLoader()
            self.displayPDF()
        }
    }
}
