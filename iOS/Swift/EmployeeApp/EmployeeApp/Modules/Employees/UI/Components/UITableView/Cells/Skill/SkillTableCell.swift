//
//  
//  SkillTableCell.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/30/24.
//
//

import Foundation
import UIKit

class SkillTableCell: UITableViewCell {
    var viewModel: SkillTableCellViewModelProtocol!  {
        didSet {
            refresh()
        }
    }
    
    @IBOutlet private(set) var skillLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

// MARK: - Refresh

private extension SkillTableCell {
    func refresh() {
        skillLabel.text = viewModel.skillText
    }
}

// MARK: - Setup

private extension SkillTableCell {
    func setup() {
        selectionStyle = .none
    }
}
