//
//  CreateAccountPresenter.swift
//  Litera
//
//  Created by Oleg Prygunov on 20.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class CreateAccountPresenter {
    weak var view: CreateAccountDisplayLogic?

    init(view: CreateAccountDisplayLogic) {
        self.view = view
    }
}

extension CreateAccountPresenter: CreateAccountPresentationLogic {

    func present(_ response: CreateAccount.Fetch.Response) {
        view?.display(CreateAccount.Fetch.ViewModel())
    }

    func present(_ response: CreateAccount.Close.Response) {
        view?.display(CreateAccount.Close.ViewModel())
    }

    func present(_ response: CreateAccount.CreateLogin.Response) {
        view?.display(
            CreateAccount.CreateLogin.ViewModel(
                root: .init(
                    userData:
                            .init(
                                mail: response.model.userData.mail,
                                password: response.model.userData.password,
                                confirmedPassword: response.model.userData.confirmedPassword,
                                iconHaveNumbers: response.hasNumber,
                                iconMinimumCharacters: response.hasMinimumCharacters,
                                isEnableButton: response.hasNumber && response.hasMinimumCharacters && response.hasMatchingPasswords
                            )
                )
            )
        )
    }

    func present(_ response: CreateAccount.CreatePassword.Response) {
        view?.display(
            CreateAccount.CreatePassword.ViewModel(
                root: .init(
                    userData:
                            .init(
                                mail: response.model.userData.mail,
                                password: response.model.userData.password,
                                confirmedPassword: response.model.userData.confirmedPassword,
                                iconHaveNumbers: response.hasNumber,
                                iconMinimumCharacters: response.hasMinimumCharacters,
                                isEnableButton: response.hasNumber && response.hasMinimumCharacters && response.hasMatchingPasswords,
                                isPasswordErrorState: response.isPasswordErrorState
                            )
                )
            )
        )
    }

    func present(_ response: CreateAccount.ConfirmPassword.Response) {
        view?.display(
            CreateAccount.ConfirmPassword.ViewModel(
                root: .init(
                    userData:
                            .init(
                                mail: response.model.userData.mail,
                                password: response.model.userData.password,
                                confirmedPassword: response.model.userData.confirmedPassword,
                                iconHaveNumbers: response.hasNumber,
                                iconMinimumCharacters: response.hasMinimumCharacters,
                                isEnableButton: response.hasNumber && response.hasMinimumCharacters && response.hasMatchingPasswords,
                                isRePasswordErrorState: response.isRePasswordErrorState
                            )
                )
            )
        )
    }

    func present(_ response: CreateAccount.Enter.Response) {
        view?.display(CreateAccount.Enter.ViewModel())
    }

    func present(_ response: CreateAccount.DoAccount.Response) {
        view?.display(CreateAccount.DoAccount.ViewModel())
    }
}

private extension CreateAccount.Model {
    func viewModel(hasMinimumCharacters: Bool, hasNumber: Bool) -> CreateAccount.RootViewModel {
        return .init(
            userData: .init(
                mail: userData.mail,
                password: userData.password,
                confirmedPassword: userData.confirmedPassword,
                iconHaveNumbers: hasNumber,
                iconMinimumCharacters: hasMinimumCharacters
            )
        )
    }
}
