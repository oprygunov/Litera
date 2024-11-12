//
//  WelcomeRouter.swift
//  Litera
//
//  Created by Oleg Prygunov on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class WelcomeRouter {
    weak var viewController: WelcomeViewController?
    var dataStore: WelcomeDataStore?

    init(viewController: WelcomeViewController, dataStore: WelcomeDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension WelcomeRouter: WelcomeRoutingLogic {
    func registration() {
        viewController?.navigationController?.pushViewController(SignUpBuilder.build(), animated: true)
    }
    
    func login() {
        viewController?.navigationController?.pushViewController(PageOfAuthorBuilder.build(), animated: true)
    }
}
