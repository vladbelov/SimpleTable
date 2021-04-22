//
//  TableItem.swift
//  SimpleTable
//
//  Created by Vladislav Belov on 04.10.2020.
//  Copyright © 2020 Белов В.С. All rights reserved.
//

import Foundation
import UIKit

public final class TableItem<CellType: TableItemView>: TableItemProtocol where CellType: UIView {
    
    public var cellType: AnyClass {
        return CellType.self
    }
    
    public var identifier: String {
        return String(describing: cellType)
    }
    
    public var fixedHeight: CGFloat? {
        return CellType.fixedHeight
    }
    
    public var estimatedHeight: CGFloat? {
        return CellType.estimatedHeight
    }
    
    public func setup(_ tableItem: UIView) {
        <#code#>
    }
    
}
