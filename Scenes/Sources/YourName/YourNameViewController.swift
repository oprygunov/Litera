//
//  YourNameViewController.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class YourNameViewController: UIViewController {
    var interactor: YourNameBusinessLogic?
    var router: YourNameRoutingLogic?

    private lazy var rootView = YourNameView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .save:
                self.interactor?.request(YourName.SaveName.Request())
            case .name(let text):
                self.interactor?.request(YourName.NameText.Request(name: text))
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(YourName.Fetch.Request())
    }
}

extension YourNameViewController: YourNameDisplayLogic {

    func display(_ viewModel: YourName.Fetch.ViewModel) {
    }

    func display(_ viewModel: YourName.NameText.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    func display(_ viewModel: YourName.SaveName.ViewModel) {
        router?.save()
    }
}
