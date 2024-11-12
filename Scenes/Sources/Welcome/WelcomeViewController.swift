//
//  WelcomeViewController.swift
//  Litera
//
//  Created by Oleg Prygunov on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class WelcomeViewController: UIViewController {
    var interactor: WelcomeBusinessLogic?
    var router: WelcomeRoutingLogic?

    private lazy var rootView = WelcomeView()

    override func loadView() {
        super.loadView()
        view = rootView
        
        rootView.actionHandler = { action in
            switch action {
            case .registration:
                self.interactor?.request(Welcome.Registration.Request())
            case .login:
                self.interactor?.request(Welcome.Login.Request())
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(Welcome.Fetch.Request())
    }
}

extension WelcomeViewController: WelcomeDisplayLogic {
    func display(_ viewModel: Welcome.Fetch.ViewModel) {
        
    }
    
    func display(_ viewModel: Welcome.Registration.ViewModel) {
        router?.registration()
    }
    
    func display(_ viewModel: Welcome.Login.ViewModel) {
        router?.login()
    }
}
