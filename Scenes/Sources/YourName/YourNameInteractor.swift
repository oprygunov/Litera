//
//  YourNameInteractor.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class YourNameInteractor {
    private let presenter: YourNamePresentationLogic
    private let worker: YourNameWorkingLogic
    private var name: String = ""

    init(presenter: YourNamePresentationLogic, worker: YourNameWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }

    private func hasNotEmpty() -> Bool {
        return self.name.count > 0
    }
}

extension YourNameInteractor: YourNameBusinessLogic {

    func request(_ request: YourName.Fetch.Request) {
        presenter.present(YourName.Fetch.Response())
    }
    
    func request(_ request: YourName.NameText.Request) {
        self.name = request.name
        presenter.present(
            YourName.NameText.Response(
                name: self.name,
                hasNotEmpty: self.hasNotEmpty()
            )
        )
    }

    func request(_ request: YourName.SaveName.Request) {
        worker.save(save: name) {
            DispatchQueue.main.async {
                self.presenter.present(
                    YourName.SaveName.Response()
                )
            }
        }
    }
}

extension YourNameInteractor: YourNameDataStore {}
