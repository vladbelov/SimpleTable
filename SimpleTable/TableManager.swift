//
//  SimpleTable.swift
//  SimpleTable
//
//  Created by Белов В.С. on 03.10.2020.
//  Copyright © 2020 Белов В.С. All rights reserved.
//

import UIKit

public final class TableManager: NSObject {
    
    private let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
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
