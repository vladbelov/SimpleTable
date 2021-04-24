//
//  KeatManager+TableView.swift
//  SimpleTable
//
//  Created by Vladislav Belov on 22.04.2021.
//  Copyright © 2021 Белов В.С. All rights reserved.
//

import UIKit

extension KeatManager: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension KeatManager: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
    
}
