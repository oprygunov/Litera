//
//  CreateAccountRouter.swift
//  Litera
//
//  Created by Oleg Prygunov on 20.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class CreateAccountRouter {
    weak var viewController: CreateAccountViewController?
    var dataStore: CreateAccountDataStore?

    init(viewController: CreateAccountViewController, dataStore: CreateAccountDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension CreateAccountRouter: CreateAccountRoutingLogic {
    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func enter() { }

    func doAccount() {
        viewController?.navigationController?.pushViewController(YourNameBuilder.build(), animated: true)
    }
}
