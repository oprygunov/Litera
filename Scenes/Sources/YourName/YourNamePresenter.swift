//
//  YourNamePresenter.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class YourNamePresenter {
    weak var view: YourNameDisplayLogic?

    init(view: YourNameDisplayLogic) {
        self.view = view
    }
}

extension YourNamePresenter: YourNamePresentationLogic {

    func present(_ response: YourName.Fetch.Response) {
        view?.display(YourName.Fetch.ViewModel())
    }
    
    func present(_ response: YourName.NameText.Response) {
        view?.display(
            YourName.NameText.ViewModel(
                root: .init(
                    name: response.name,
                    isEnableButton: response.hasNotEmpty
                )
            )
        )
    }
    func present(_ response: YourName.SaveName.Response) {
        view?.display(YourName.SaveName.ViewModel())
    }
}

private extension YourName.Model {
    func viewModel(hasNotEmpty: Bool) -> YourName.RootViewModel {
       return .init(
            name: profile.name
        )
    }
}
