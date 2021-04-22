//
//  CellProvider.swift
//  SimpleTable
//
//  Created by Vladislav Belov on 04.10.2020.
//  Copyright © 2020 Белов В.С. All rights reserved.
//

import Foundation
import UIKit

class CellProvider: NSObject {
    
    private weak var tableView: UITableView?
    
    private var registeredCellIds = Set<String>()
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }
    
    func getCell(cellType: AnyClass, reuseIdentifier: String) -> UITableViewCell? {
        registerCellIfNeeded(cellType: cellType, reuseIdentifier: reuseIdentifier)
        
        let cell = tableView?.dequeueReusableCell(withIdentifier: reuseIdentifier)
        return cell
    }
    
    private func registerCellIfNeeded(cellType: AnyClass, reuseIdentifier: String) {
        guard !registeredCellIds.contains(reuseIdentifier) else { return }
        
        if tableView?.dequeueReusableCell(withIdentifier: reuseIdentifier) != nil {
            registeredCellIds.insert(reuseIdentifier)
            return
        }
        
        tableView?.register(cellType, forCellReuseIdentifier: reuseIdentifier)
    }
    
}
