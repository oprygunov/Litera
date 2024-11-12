//
//  SelectionGenresRouter.swift
//  Litera
//
//  Created by Oleg Prygunov on 09.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class SelectionGenresRouter {
    weak var viewController: SelectionGenresViewController?
    var dataStore: SelectionGenresDataStore?

    init(viewController: SelectionGenresViewController, dataStore: SelectionGenresDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension SelectionGenresRouter: SelectionGenresRoutingLogic {
    func continueButton() {
        viewController?.navigationController?.pushViewController(PageOfAuthorBuilder.build(), animated: true)
    }
}
