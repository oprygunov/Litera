//
//  PageOfAuthorBuilder.swift
//  CollectionView
//
//  Created by Oleg Prygunov on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

public final class PageOfAuthorBuilder {
    public static func build() -> UIViewController {
        let viewController = PageOfAuthorViewController()
        let presenter = PageOfAuthorPresenter(view: viewController)
        let interactor = PageOfAuthorInteractor(
            presenter: presenter,
            worker: PageOfAuthorWorker()
        )
        let router = PageOfAuthorRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
