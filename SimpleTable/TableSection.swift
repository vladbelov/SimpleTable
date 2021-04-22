//
//  TableSection.swift
//  SimpleTable
//
//  Created by Vladislav Belov on 04.10.2020.
//  Copyright © 2020 Белов В.С. All rights reserved.
//

import Foundation

public final class TableSection: NSObject {
    
    public var items: [TableItemProtocol]
    
    public init(items: [TableItemProtocol] = []) {
        self.items = items
        super.init()
    }
    
}
