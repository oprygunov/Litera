//
//  LaunchScreenViewController.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class LaunchScreenViewController: UIViewController {
    var interactor: LaunchScreenBusinessLogic?
    var router: LaunchScreenRoutingLogic?

    private lazy var rootView = LaunchScreenView()

    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.request(LaunchScreen.Fetch.Request())
    }
}

extension LaunchScreenViewController: LaunchScreenDisplayLogic {
    func display(_ viewModel: LaunchScreen.Fetch.ViewModel) {
        switch viewModel.route {
        case .welcome:
            router?.showWelcome()
        case .tabs:
            router?.showTabs()
        }
    }
}
