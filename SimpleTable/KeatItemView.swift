//
//  KeatItemView.swift
//  SimpleTable
//
//  Created by Vladislav Belov on 23.04.2021.
//  Copyright © 2021 Белов В.С. All rights reserved.
//

import UIKit

public protocol KeatItemView: UIView {
    
    associatedtype Model
    
    func setup(with model: Model, delegate: KeatManagerDelegate?)
    
}
