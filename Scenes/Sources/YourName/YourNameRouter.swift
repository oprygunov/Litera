//
//  YourNameRouter.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class YourNameRouter {
    weak var viewController: YourNameViewController?
    var dataStore: YourNameDataStore?

    init(viewController: YourNameViewController, dataStore: YourNameDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension YourNameRouter: YourNameRoutingLogic {
    func save() {
        viewController?.navigationController?.pushViewController(SelectionGenresBuilder.build(), animated: true)
    }
}
