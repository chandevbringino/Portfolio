//
//  
//  SkillsController.swift
//  EmployeeApp
//
//  Created by Christian Bringino on 7/30/24.
//
//

import Foundation
import UIKit

class SkillsController: ViewController {
    var viewModel: SkillsViewModelProtocol!
    
    @IBOutlet private(set) var tableView: UITableView!
}

// MARK: - Lifecycle

extension SkillsController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup

private extension SkillsController {
    func setup() {
        setupNavBar()
        setupTableView()
    }
    
    func setupNavBar() {
//        title = viewModel.isTechnicalSkills ? 
    }
    
    func setupTableView() {
        tableView.register(R.nib.skillTableCell)
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource

extension SkillsController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.skillsCount
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: R.nib.skillTableCell.identifier,
            for: indexPath
        ) as? SkillTableCell
        else { return SkillTableCell() }
        
        cell.viewModel = viewModel.skillCellVM(at: indexPath.row)
        
        return cell
    }
}
