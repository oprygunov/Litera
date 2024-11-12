//
//  PageOfAuthorRouter.swift
//  CollectionView
//
//  Created by Oleg Prygunov on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class PageOfAuthorRouter {
    weak var viewController: PageOfAuthorViewController?
    var dataStore: PageOfAuthorDataStore?

    init(viewController: PageOfAuthorViewController, dataStore: PageOfAuthorDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension PageOfAuthorRouter: PageOfAuthorRoutingLogic {
    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
