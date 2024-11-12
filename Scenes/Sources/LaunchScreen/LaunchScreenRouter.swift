//
//  LaunchScreenRouter.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class LaunchScreenRouter {
    weak var viewController: LaunchScreenViewController?
    var dataStore: LaunchScreenDataStore?

    init(viewController: LaunchScreenViewController, dataStore: LaunchScreenDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension LaunchScreenRouter: LaunchScreenRoutingLogic {
    func showWelcome() {
        print("not login")
        viewController?.navigationController?.viewControllers = [WelcomeBuilder.build()]
    }
    
    func showTabs() {
        print("login")
        viewController?.navigationController?.viewControllers = [WelcomeBuilder.build()]
    }

}
