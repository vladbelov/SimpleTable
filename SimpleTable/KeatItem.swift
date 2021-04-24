//
//  KeatItem.swift
//  SimpleTable
//
//  Created by Vladislav Belov on 22.04.2021.
//  Copyright © 2021 Белов В.С. All rights reserved.
//

import UIKit

public final class KeatItem<T: KeatItemView>: KeatItemProtocol {
    
    public var identifier: String {
        T.objectName
    }
    
    public var cellType: UIView.Type {
        T.self
    }
    
    public var data: AnyObject {
        return model as AnyObject
    }
    
    public var model: T.Model
    
    public init(model: T.Model) {
        self.model = model
    }
    
    public func setup(cell: UIView, delegate: KeatManagerDelegate?) {
        guard let cell = cell as? T else { return }
        cell.setup(with: model, delegate: delegate)
    }
    
}
