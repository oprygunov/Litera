//
//  CreateAccountViewController.swift
//  Litera
//
//  Created by Oleg Prygunov on 20.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class CreateAccountViewController: UIViewController {
    var interactor: CreateAccountBusinessLogic?
    var router: CreateAccountRoutingLogic?

    private lazy var rootView = CreateAccountView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(CreateAccount.Close.Request())
            case .mail(let text):
                self.interactor?.request(CreateAccount.CreateLogin.Request(login: text))
            case .password(let text):
                self.interactor?.request(CreateAccount.CreatePassword.Request(password: text))
            case .confirmedPassword(let text):
                self.interactor?.request(CreateAccount.ConfirmPassword.Request(confirmedPassword: text))
            case .editEnd:
                break
            case .enter:
                self.interactor?.request(CreateAccount.Enter.Request())
            case .doAccount:
                self.interactor?.request(CreateAccount.DoAccount.Request())
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(CreateAccount.Fetch.Request())
    }
}

extension CreateAccountViewController: CreateAccountDisplayLogic {

    func display(_ viewModel: CreateAccount.Fetch.ViewModel) {
    }
    func display(_ viewModel: CreateAccount.Close.ViewModel) {
        router?.close()
    }
    func display(_ viewModel: CreateAccount.CreateLogin.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    func display(_ viewModel: CreateAccount.CreatePassword.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    func display(_ viewModel: CreateAccount.ConfirmPassword.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    func display(_ viewModel: CreateAccount.Enter.ViewModel) {
        router?.enter()
    }
    func display(_ viewModel: CreateAccount.DoAccount.ViewModel) {
        router?.doAccount()
    }
}
