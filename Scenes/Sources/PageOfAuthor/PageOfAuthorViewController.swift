//
//  PageOfAuthorViewController.swift
//  CollectionView
//
//  Created by Oleg Prygunov on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class PageOfAuthorViewController: UIViewController {
    var interactor: PageOfAuthorBusinessLogic?
    var router: PageOfAuthorRoutingLogic?

    private lazy var rootView = PageOfAuthorView()

    override func loadView() {
        super.loadView()
        view = rootView

        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(PageOfAuthor.Close.Request())
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(PageOfAuthor.Fetch.Request())
    }
}

extension PageOfAuthorViewController: PageOfAuthorDisplayLogic {
    func display(_ viewModel: PageOfAuthor.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }

    func display(_ viewModel: PageOfAuthor.Close.ViewModel) {
        router?.close()
    }
}
