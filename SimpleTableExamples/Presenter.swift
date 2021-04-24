//
//  Presenter.swift
//  SimpleTableExamples
//
//  Created by Vladislav Belov on 23.04.2021.
//  Copyright © 2021 Белов В.С. All rights reserved.
//

final class Presenter {
    
    // MARK: - Properties
    
    weak var view: ViewController?
    
    var viewModels = [CellItem.Model(backgroundColor: .random())]
    
}
