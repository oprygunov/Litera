//
//  LaunchScreenPresenter.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class LaunchScreenPresenter {
    weak var view: LaunchScreenDisplayLogic?

    init(view: LaunchScreenDisplayLogic) {
        self.view = view
    }
}

extension LaunchScreenPresenter: LaunchScreenPresentationLogic {
    func present(_ response: LaunchScreen.Fetch.Response) {
        view?.display(
            LaunchScreen.Fetch.ViewModel(
                route: response.model?.route() ?? .welcome
            )
        )
    }
}

private extension LaunchScreen.Model {
    func route() -> LaunchScreen.Route {
        if didLogin {
            return .tabs
        }
        else {
            return .welcome
        }
    }
}
