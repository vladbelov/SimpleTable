//
//  KeatItemProtocol.swift
//  SimpleTable
//
//  Created by Vladislav Belov on 23.04.2021.
//  Copyright © 2021 Белов В.С. All rights reserved.
//

import UIKit

public protocol KeatItemProtocol {
    
    var identifier: String { get }
    
    var cellType: UIView.Type { get }
    
    var data: AnyObject { get }
    
    func setup(cell: UIView, delegate: KeatManagerDelegate?)
    
}
