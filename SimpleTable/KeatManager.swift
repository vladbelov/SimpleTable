//
//  KeatManager.swift
//  SimpleTable
//
//  Created by Vladislav Belov on 22.04.2021.
//  Copyright © 2021 Белов В.С. All rights reserved.
//

import UIKit

/// Main TableManager class.
public final class KeatManager: NSObject {
    
    typealias DataSource = UITableViewDiffableDataSource<KeatSection, KeatItemModel>
    typealias Snapshot = NSDiffableDataSourceSnapshot<KeatSection, KeatItemModel>
    
    // MARK: - Properties
    
    private weak var tableView: UITableView?
    private var dataSource: DataSource?
    
    public lazy var sections = [defaultSection]
    
    public var defaultSection = KeatSection(items: [])
    
    private lazy var snapshot = sections
    private var registeredCellsIdentifiers = Set<String>()
    
    
    // MARK: - Initialization
    
    /// Create TableManager with UITableView.
    public init(tableView: UITableView,
                delegate: KeatManagerDelegate? = nil) {
        super.init()
        self.tableView = tableView
        self.setup(tableView: tableView)
    }
    
    private func setup(tableView: UITableView) {
        tableView.tableFooterView = UIView()
        tableView.keyboardDismissMode = .onDrag
        tableView.separatorStyle = .none
        
        makeDataSource(with: tableView)
    }
    
    private func makeDataSource(with tableView: UITableView) {
        let dataSource = DataSource(tableView: tableView) { [weak self] (tableView, indexPath, model) in
            guard let self = self else { return nil }
            guard let item = self.getItem(for: indexPath) else { return nil }
            
            if !self.registeredCellsIdentifiers.contains(item.identifier) {
                tableView.register(item.cellType, forCellReuseIdentifier: item.identifier)
                self.registeredCellsIdentifiers.insert(item.identifier)
            }
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: item.identifier) else { return nil }
            item.setup(cell: cell, delegate: nil)
            return cell
        }
        
        self.dataSource = dataSource
    }
    
    private func getItem(for indexPath: IndexPath) -> KeatItemProtocol? {
        return snapshot[safe: indexPath.section]?.items[safe: indexPath.row]
    }
    
    public func applyChanges(animated: Bool) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        sections.forEach { section in
            let items = section.items.map { KeatItemModel(model: $0.data) }
            snapshot.appendItems(items, toSection: section)
        }
        dataSource?.apply(snapshot)
    }
    
}

extension Array {
    
    subscript(safe index: Int) -> Element? {
        guard self.count > index else { return nil }
        return self[index]
    }
    
}

extension UITableView {
    
    func register<T: UITableViewCell>(_ type: T.Type) {
        register(type, forCellReuseIdentifier: type.objectName)
    }
    
}

extension NSObject {
    
    static var objectName: String {
        return String(describing: self)
    }
    
}
