//
//  SimpleTable.swift
//  SimpleTable
//
//  Created by Белов В.С. on 03.10.2020.
//  Copyright © 2020 Белов В.С. All rights reserved.
//

import UIKit

public final class TableManager: NSObject {
    
    public lazy var sections: [TableSection] = [] {
        didSet {
            applyChanges()
        }
    }
    
    private let cellProvider: CellProvider
    
    private weak var tableView: UITableView?
    
    public init(tableView: UITableView) {
        self.tableView = tableView
        cellProvider = CellProvider(tableView: tableView)
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
    
    private func applyChanges() {
        tableView?.reloadData()
    }
    
}

extension TableManager: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        guard let cell = cellProvider.getCell(cellType: item.cellType, reuseIdentifier: item.identifier) else {
            return UITableViewCell()
        }
        
        return cell
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // TODO: Need to implement
        return nil
    }

    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        // TODO: Need to implement
        return nil
    }

    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // TODO: Need to implement
        return false
    }
    
    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // TODO: Need to implement
        return false
    }
    
}

extension TableManager: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = sections[indexPath.section].items[indexPath.row]
        return item.fixedHeight ?? UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = sections[indexPath.section].items[indexPath.row]
        return item.estimatedHeight ?? UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
