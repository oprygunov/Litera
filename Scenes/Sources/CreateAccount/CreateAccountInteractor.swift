//
//  CreateAccountInteractor.swift
//  Litera
//
//  Created by Oleg Prygunov on 20.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class CreateAccountInteractor {
    private let presenter: CreateAccountPresentationLogic
    private let worker: CreateAccountWorkingLogic
    private var mail: String = ""
    private var password: String = ""
    private var confirmPassword: String = ""

    init(presenter: CreateAccountPresentationLogic, worker: CreateAccountWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }

    private func hasNumber() -> Bool {
        return self.password.contains(where: { "0123456789".contains($0) })
    }

    private func hasMinimumCharacters() -> Bool {
        return self.password.count > 7
    }

    private func hasMatchingPasswords() -> Bool {
        return self.password == self.confirmPassword
    }
}

extension CreateAccountInteractor: CreateAccountBusinessLogic {

    func request(_ request: CreateAccount.Fetch.Request) {
        presenter.present(CreateAccount.Fetch.Response())
    }

    func request(_ request: CreateAccount.Close.Request) {
        presenter.present(CreateAccount.Close.Response())
    }

    func request(_ request: CreateAccount.CreateLogin.Request) {
        self.mail = request.login
            presenter.present(CreateAccount.CreateLogin.Response(
                model: .init(
                    userData: .init(
                        mail: self.mail,
                        password: self.password,
                        confirmedPassword: self.confirmPassword)
                ),
                hasNumber: self.hasNumber(),
                hasMinimumCharacters: self.hasMinimumCharacters(),
                hasMatchingPasswords: self.hasMatchingPasswords()
                )
            )
    }

    func request(_ request: CreateAccount.CreatePassword.Request) {
        self.password = request.password
            let hasValidPassword = hasNumber() && hasMinimumCharacters()
            let isErrorState = !hasValidPassword
            presenter.present(
                CreateAccount.CreatePassword.Response(
                    model: .init(
                        userData: .init(
                            mail: self.mail,
                            password: self.password,
                            confirmedPassword: self.confirmPassword)
                    ),
                    hasNumber: self.hasNumber(),
                    hasMinimumCharacters: self.hasMinimumCharacters(),
                    hasMatchingPasswords: self.hasMatchingPasswords(),
                    isPasswordErrorState: isErrorState
                    )
                )
    }

    func request(_ request: CreateAccount.ConfirmPassword.Request) {
        self.confirmPassword = request.confirmedPassword
            let hasValidPassword = hasNumber() && hasMinimumCharacters() && hasMatchingPasswords()
            let isErrorState = !hasValidPassword
            presenter.present(
                CreateAccount.ConfirmPassword.Response(
                    model:  .init(
                        userData: .init(
                            mail: self.mail,
                            password: self.password,
                            confirmedPassword: self.confirmPassword)
                    ),
                    hasNumber: self.hasNumber(),
                    hasMinimumCharacters: self.hasMinimumCharacters(),
                    hasMatchingPasswords: self.hasMatchingPasswords(),
                    isRePasswordErrorState: isErrorState
                )
            )
    }

    func request(_ request: CreateAccount.Enter.Request) {
        presenter.present(CreateAccount.Enter.Response()
        )
    }

    func request(_ request: CreateAccount.DoAccount.Request) {
        worker.create(mail: self.mail, password: self.password) {
            DispatchQueue.main.async {
                self.presenter.present(
                    CreateAccount.DoAccount.Response()
                )
            }
        }
    }
}

extension CreateAccountInteractor: CreateAccountDataStore {}
