//
//  CellItem.swift
//  SimpleTableExamples
//
//  Created by Vladislav Belov on 24.04.2021.
//  Copyright © 2021 Белов В.С. All rights reserved.
//

import UIKit

final class CellItem: UITableViewCell {
    
    // MARK: - Model
    
    struct Model: Hashable {
        let backgroundColor: UIColor
    }
    
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        contentView.backgroundColor = .black
    }
    
    
}

extension CellItem: KeatItemView {
    
    // MARK: - KeatItemView
    
    func setup(with model: Model, delegate: KeatManagerDelegate?) {
        contentView.backgroundColor = model.backgroundColor
    }
    
}

extension UIColor {
    static func random() -> UIColor {
        var randomCGFloat: CGFloat {
            CGFloat(arc4random()) / CGFloat(UInt32.max)
        }
        
        return UIColor(red: randomCGFloat,
                       green: randomCGFloat,
                       blue: randomCGFloat,
                       alpha: 1.0)
    }
}
