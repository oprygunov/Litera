//
//  CreateAccountBuilder.swift
//  Litera
//
//  Created by Oleg Prygunov on 20.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

public final class CreateAccountBuilder {
   public static func build() -> UIViewController {
        let viewController = CreateAccountViewController()
        let presenter = CreateAccountPresenter(view: viewController)
        let interactor = CreateAccountInteractor(
            presenter: presenter,
            worker: CreateAccountWorker()
        )
        let router = CreateAccountRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
