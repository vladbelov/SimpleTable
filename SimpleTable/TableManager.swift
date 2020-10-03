//
//  SimpleTable.swift
//  SimpleTable
//
//  Created by Белов В.С. on 03.10.2020.
//  Copyright © 2020 Белов В.С. All rights reserved.
//

import UIKit

public class TableSection: NSObject {
    
}

public protocol TableItemProtocol {
    
}

public final class TableManager: NSObject {
    
    private let defaultSection = TableSection()
    
    private weak var tableView: UITableView?
    
    public init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView?.tableFooterView = UIView()
        tableView?.keyboardDismissMode = .onDrag
        tableView?.separatorStyle = .none
        tableView?.dataSource = self
        tableView?.delegate = self
    }
    
}

extension TableManager: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}

extension TableManager: UITableViewDelegate {
    
}
