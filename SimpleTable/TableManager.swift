//
//  SimpleTable.swift
//  SimpleTable
//
//  Created by Белов В.С. on 03.10.2020.
//  Copyright © 2020 Белов В.С. All rights reserved.
//

import UIKit

class CellProvider: NSObject {
    
    private weak var tableView: UITableView?
    
    private var registeredCellIds = Set<String>()
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }
    
    func getCell(cellClass: AnyClass, reuseIdentifier: String) -> UITableViewCell? {
        registerCellIfNeeded(cellClass: cellClass, reuseIdentifier: reuseIdentifier)
        
        let cell = tableView?.dequeueReusableCell(withIdentifier: reuseIdentifier)
        return cell
    }
    
    private func registerCellIfNeeded(cellClass: AnyClass, reuseIdentifier: String) {
        if registeredCellIds.contains(reuseIdentifier) {
            return
        }
        
        if tableView?.dequeueReusableCell(withIdentifier: reuseIdentifier) != nil {
            registeredCellIds.insert(reuseIdentifier)
            return
        }
        
        let bundle = Bundle(for: cellClass)

        if bundle.path(forResource: reuseIdentifier, ofType: "nib") != nil {
            tableView?.register(UINib(nibName: reuseIdentifier,
                                      bundle: bundle),
                                forCellReuseIdentifier: reuseIdentifier)
        } else {
            tableView?.register(cellClass, forCellReuseIdentifier: reuseIdentifier)
        }
    }
    
}

public class TableSection: NSObject {
    
    public var items: [TableItemProtocol]
    
    public init(items: [TableItemProtocol] = []) {
        self.items = items
        super.init()
    }
    
}

public final class TableItem<CellClass: TableItemProtocol> {
    
    private var identifier: String {
        return String(describing: CellClass.self)
    }
    
}

public protocol TableItemProtocol: UIView {
    
    var identifier: String { get set }
    
}

public final class TableManager: NSObject {
    
    public lazy var sections: [TableSection] = [] {
        didSet {
            
        }
    }
    
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
    
    private func applyChanges() {
        
        tableView?.reloadData()
    }
    
}

extension TableManager: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        // TODO: Need to implement
        return 0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Need to implement
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Need to implement
        return UITableViewCell()
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
        // TODO: Need to implement
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // TODO: Need to implement
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
