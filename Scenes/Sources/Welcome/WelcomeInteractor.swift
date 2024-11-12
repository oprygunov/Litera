//
//  WelcomeInteractor.swift
//  Litera
//
//  Created by Oleg Prygunov on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class WelcomeInteractor {
    private let presenter: WelcomePresentationLogic
    private let worker: WelcomeWorkingLogic

    init(presenter: WelcomePresentationLogic, worker: WelcomeWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension WelcomeInteractor: WelcomeBusinessLogic {
    func request(_ request: Welcome.Fetch.Request) {
        presenter.present(Welcome.Fetch.Response())
    }
    
    func request(_ request: Welcome.Registration.Request) {
        presenter.present(Welcome.Registration.Response())
    }
    
    func request(_ request: Welcome.Login.Request) {
        presenter.present(Welcome.Login.Response())
    }
}

extension WelcomeInteractor: WelcomeDataStore {}
