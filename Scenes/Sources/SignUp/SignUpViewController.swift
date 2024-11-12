//
//  SignUpViewController.swift
//  Litera
//
//  Created by Oleg Prygunov on 02.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class SignUpViewController: UIViewController {
    var interactor: SignUpBusinessLogic?
    var router: SignUpRoutingLogic?

    private lazy var rootView = SignUpView()

    override func loadView() {
        super.loadView()
        view = rootView
        
        rootView.actionHandler = { action in
            switch action {
            case .continueWithApple:
                self.interactor?.request(SignUp.ContinueWithApple.Request())
            case .continueWithGoogle:
                self.interactor?.request(SignUp.ContinueWithGoogle.Request())
            case .createAccount:
                self.interactor?.request(SignUp.CreateAccount.Request())
            case .termsOfUse:
                self.interactor?.request(SignUp.TermsOfUse.Request())
            case .privacyPolicy:
                self.interactor?.request(SignUp.PrivacyPolicy.Request())
            case .enterAccount:
                self.interactor?.request(SignUp.EnterAccount.Request())
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(SignUp.Fetch.Request())
    }
}

extension SignUpViewController: SignUpDisplayLogic {
    func display(_ viewModel: SignUp.Fetch.ViewModel) {
        
    }
    
    func display(_ viewModel: SignUp.ContinueWithApple.ViewModel) {
        router?.continueWithApple()
    }
    
    func display(_ viewModel: SignUp.ContinueWithGoogle.ViewModel) {
        router?.continueWithGoogle()
    }
    
    func display(_ viewModel: SignUp.CreateAccount.ViewModel) {
        router?.createAccount()
    }
    
    func display(_ viewModel: SignUp.TermsOfUse.ViewModel) {
        router?.termsOfUse()
    }
    
    func display(_ viewModel: SignUp.PrivacyPolicy.ViewModel) {
        router?.privacyPolicy()
    }
    
    func display(_ viewModel: SignUp.EnterAccount.ViewModel) {
        router?.enterAccount()
    }
}
