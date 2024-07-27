//
//  GenericPickerView.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/27/24.
//

import UIKit

class GenericPickerView: UIPickerView {
    var viewModel: GenericPickerViewModelProtocol! {
        didSet { setupVM() }
    }
    
    var onSelectOption: SingleResult<String>?
    var onReload: VoidResult?
    
    weak var textField: UITextField? {
      didSet { setupTextField() }
    }

    convenience init() {
      self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}

// MARK: - Setup

private extension GenericPickerView {
    func setup() {
        delegate = self
        dataSource = self
    }
    
    func setupTextField() {
        guard let field = textField else { return }
        field.inputView = self
    }
    
    func setupVM() {
        onReload = handleOptionsReload()
    }
}

// MARK: - Handlers

private extension GenericPickerView {
    func handleOptionsReload() -> VoidResult {
        { [weak self] in
            guard let self else { return }
            self.reloadAllComponents()
        }
    }
}

// MARK: - UIPickerViewDataSource

extension GenericPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        viewModel.options.count
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        viewModel.options[row]
    }
}

// MARK: - UIPickerViewDelegate

extension GenericPickerView: UIPickerViewDelegate {
    func pickerView(
        _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ) {
        let text = viewModel.options[row]
        textField?.text = text
        onSelectOption?(text)
    }
}
