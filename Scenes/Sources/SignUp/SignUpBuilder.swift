//
//  SignUpBuilder.swift
//  Litera
//
//  Created by Oleg Prygunov on 02.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class SignUpBuilder {
    static func build() -> UIViewController {
        let viewController = SignUpViewController()
        let presenter = SignUpPresenter(view: viewController)
        let interactor = SignUpInteractor(
            presenter: presenter,
            worker: SignUpWorker()
        )
        let router = SignUpRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
