//
//  LaunchScreenBuilder.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

public final class LaunchScreenBuilder {
    public static func build() -> UIViewController {
        let viewController = LaunchScreenViewController()
        let presenter = LaunchScreenPresenter(view: viewController)
        let interactor = LaunchScreenInteractor(
            presenter: presenter,
            worker: LaunchScreenWorker()
        )
        let router = LaunchScreenRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
