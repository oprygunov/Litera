//
//  SignUpProtocols.swift
//  Litera
//
//  Created by Oleg Prygunov on 02.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol SignUpBusinessLogic: AnyObject {
    func request(_ request: SignUp.Fetch.Request)
    func request(_ request: SignUp.ContinueWithApple.Request)
    func request(_ request: SignUp.ContinueWithGoogle.Request)
    func request(_ request: SignUp.CreateAccount.Request)
    func request(_ request: SignUp.TermsOfUse.Request)
    func request(_ request: SignUp.PrivacyPolicy.Request)
    func request(_ request: SignUp.EnterAccount.Request)
}

protocol SignUpPresentationLogic: AnyObject {
    func present(_ response: SignUp.Fetch.Response)
    func present(_ response: SignUp.ContinueWithApple.Response)
    func present(_ response: SignUp.ContinueWithGoogle.Response)
    func present(_ response: SignUp.CreateAccount.Response)
    func present(_ response: SignUp.TermsOfUse.Response)
    func present(_ response: SignUp.PrivacyPolicy.Response)
    func present(_ response: SignUp.EnterAccount.Response)
}

protocol SignUpDisplayLogic: AnyObject {
    func display(_ viewModel: SignUp.Fetch.ViewModel)
    func display(_ viewModel: SignUp.ContinueWithApple.ViewModel)
    func display(_ viewModel: SignUp.ContinueWithGoogle.ViewModel)
    func display(_ viewModel: SignUp.CreateAccount.ViewModel)
    func display(_ viewModel: SignUp.TermsOfUse.ViewModel)
    func display(_ viewModel: SignUp.PrivacyPolicy.ViewModel)
    func display(_ viewModel: SignUp.EnterAccount.ViewModel)
}

protocol SignUpRoutingLogic: AnyObject {
    func continueWithApple()
    func continueWithGoogle()
    func createAccount()
    func termsOfUse()
    func privacyPolicy()
    func enterAccount()
}

protocol SignUpDataStore: AnyObject {}

protocol SignUpWorkingLogic: AnyObject {}
