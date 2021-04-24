//
//  KeatSection.swift
//  SimpleTable
//
//  Created by Vladislav Belov on 22.04.2021.
//  Copyright © 2021 Белов В.С. All rights reserved.
//

public struct KeatSection: Hashable {
    public static func == (lhs: KeatSection, rhs: KeatSection) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(5)
    }
    
    
    public var items: [KeatItemProtocol]
    
}
