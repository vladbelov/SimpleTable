//
//  TableItemProtocol.swift
//  SimpleTable
//
//  Created by Vladislav Belov on 04.10.2020.
//  Copyright © 2020 Белов В.С. All rights reserved.
//

import Foundation
import UIKit

public protocol TableItemProtocol: AnyObject {
    
    associatedtype Item
    
    var cellType: AnyClass { get }
    
    var identifier: String { get }
    
    var fixedHeight: CGFloat? { get }
    
    var estimatedHeight: CGFloat? { get }
    
    func setup(_ tableItem: UIView)
    
}
