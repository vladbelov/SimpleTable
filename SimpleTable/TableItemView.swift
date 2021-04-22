//
//  TableItemView.swift
//  SimpleTable
//
//  Created by Vladislav Belov on 04.10.2020.
//  Copyright © 2020 Белов В.С. All rights reserved.
//

import Foundation
import UIKit

public protocol TableItemView {
    
    associatedtype Item
    
    static var reuseIdentifier: String { get }
    
    static var fixedHeight: CGFloat? { get }
    
    static var estimatedHeight: CGFloat? { get }
    
    func setup(with item: Item)
    
}

public extension TableItemView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var fixedHeight: CGFloat? {
        return nil
    }
    
    static var estimatedHeight: CGFloat? {
        return nil
    }
}
