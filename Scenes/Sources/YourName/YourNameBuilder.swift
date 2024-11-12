//
//  YourNameBuilder.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class YourNameBuilder {
    static func build() -> UIViewController {
        let viewController = YourNameViewController()
        let presenter = YourNamePresenter(view: viewController)
        let interactor = YourNameInteractor(
            presenter: presenter,
            worker: YourNameWorker()
        )
        let router = YourNameRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
