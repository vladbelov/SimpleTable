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
    private var tableManager: TableManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableManager = TableManager(tableView: tableView)
        setupLayout()
        displayTableItems()
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
    
    private func displayTableItems() {
        let section = TableSection()
        let item1 = TableItem<Cell>()
        section.items.append(item1)
        tableManager?.sections = [section]
    }

}

class Cell: UITableViewCell, TableItemView {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with item: String) {
        
    }
    
}

