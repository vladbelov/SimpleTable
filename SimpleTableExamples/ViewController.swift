//
//  ViewController.swift
//  SimpleTableExamples
//
//  Created by Белов В.С. on 03.10.2020.
//  Copyright © 2020 Белов В.С. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var presenter: Presenter = {
        let presenter = Presenter()
        presenter.view = self
        return presenter
    }()
    
    private let tableView = UITableView()
    private lazy var tableManager = KeatManager(tableView: tableView)
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        updateTable()
    }
    
    private func setupLayout() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func updateTable() {
        var items = [KeatItemProtocol]()
        presenter.viewModels.forEach { model in
            let item = KeatItem<CellItem>(model: model)
            items.append(item)
        }
        
        tableManager.defaultSection.items = items
        tableManager.applyChanges(animated: true)
    }

}

