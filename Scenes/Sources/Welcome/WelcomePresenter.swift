//
//  WelcomePresenter.swift
//  Litera
//
//  Created by Oleg Prygunov on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class WelcomePresenter {
    weak var view: WelcomeDisplayLogic?

    init(view: WelcomeDisplayLogic) {
        self.view = view
    }
}

extension WelcomePresenter: WelcomePresentationLogic {
    func present(_ response: Welcome.Fetch.Response) {
        view?.display(Welcome.Fetch.ViewModel())
    }
    
    func present(_ response: Welcome.Registration.Response) {
        view?.display(Welcome.Registration.ViewModel())
    }
    
    func present(_ response: Welcome.Login.Response) {
        view?.display(Welcome.Login.ViewModel())
    }
}
