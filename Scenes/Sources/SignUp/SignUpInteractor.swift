//
//  SignUpInteractor.swift
//  Litera
//
//  Created by Oleg Prygunov on 02.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class SignUpInteractor {
    private let presenter: SignUpPresentationLogic
    private let worker: SignUpWorkingLogic

    init(presenter: SignUpPresentationLogic, worker: SignUpWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension SignUpInteractor: SignUpBusinessLogic {
    func request(_ request: SignUp.Fetch.Request) {
        presenter.present(SignUp.Fetch.Response())
    }
    
    func request(_ request: SignUp.ContinueWithApple.Request) {
        presenter.present(SignUp.ContinueWithApple.Response())
    }
    
    func request(_ request: SignUp.ContinueWithGoogle.Request) {
        presenter.present(SignUp.ContinueWithGoogle.Response())
    }
    
    func request(_ request: SignUp.CreateAccount.Request) {
        presenter.present(SignUp.CreateAccount.Response())
    }
    
    func request(_ request: SignUp.TermsOfUse.Request) {
        presenter.present(SignUp.TermsOfUse.Response())
    }
    
    func request(_ request: SignUp.PrivacyPolicy.Request) {
        presenter.present(SignUp.PrivacyPolicy.Response())
    }
    
    func request(_ request: SignUp.EnterAccount.Request) {
        presenter.present(SignUp.EnterAccount.Response())
    }
}

extension SignUpInteractor: SignUpDataStore {}
