//
//  ViewController.swift
//  SimpleTableExamples
//
//  Created by Белов В.С. on 03.10.2020.
//  Copyright © 2020 Белов В.С. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()
    private lazy var tableManager = TableManager(tableView: tableView)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
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

}

