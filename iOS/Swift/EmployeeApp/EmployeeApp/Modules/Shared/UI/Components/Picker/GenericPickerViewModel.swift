//
//  GenericPickerViewModel.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/27/24.
//

import Foundation

class GenericPickerViewModel: GenericPickerViewModelProtocol {
    private var _options: [String]
    
    init(options: [String]) {
        self._options = options
    }
}

// MARK: - Getters

extension GenericPickerViewModel {
    var options: [String] { _options }
}
