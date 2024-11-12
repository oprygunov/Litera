//
//  SignUpPresenter.swift
//  Litera
//
//  Created by Oleg Prygunov on 02.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class SignUpPresenter {
    weak var view: SignUpDisplayLogic?

    init(view: SignUpDisplayLogic) {
        self.view = view
    }
}

extension SignUpPresenter: SignUpPresentationLogic {
    func present(_ response: SignUp.Fetch.Response) {
        view?.display(SignUp.Fetch.ViewModel())
    }
    
    func present(_ response: SignUp.ContinueWithApple.Response) {
        view?.display(SignUp.ContinueWithApple.ViewModel())
    }
    
    func present(_ response: SignUp.ContinueWithGoogle.Response) {
        view?.display(SignUp.ContinueWithGoogle.ViewModel())
    }
    
    func present(_ response: SignUp.CreateAccount.Response) {
        view?.display(SignUp.CreateAccount.ViewModel())
    }
    
    func present(_ response: SignUp.TermsOfUse.Response) {
        view?.display(SignUp.TermsOfUse.ViewModel())
    }
    
    func present(_ response: SignUp.PrivacyPolicy.Response) {
        view?.display(SignUp.PrivacyPolicy.ViewModel())
    }
    
    func present(_ response: SignUp.EnterAccount.Response) {
        view?.display(SignUp.EnterAccount.ViewModel())
    }
}
