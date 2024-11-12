//
//  PageOfAuthorInteractor.swift
//  CollectionView
//
//  Created by Oleg Prygunov on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class PageOfAuthorInteractor {
    private let presenter: PageOfAuthorPresentationLogic
    private let worker: PageOfAuthorWorkingLogic
    
    private var model: PageOfAuthor.Model?

    init(presenter: PageOfAuthorPresentationLogic, worker: PageOfAuthorWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension PageOfAuthorInteractor: PageOfAuthorBusinessLogic {
    func request(_ request: PageOfAuthor.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(
                    PageOfAuthor.Fetch.Response(model:
                            .init(
                                author: model.author,
                                books: model.books,
                                audioBooks: model.audioBooks,
                                similarBooks: model.similarBooks,
                                similarAuthors: model.similarAuthors
                            )
                    )
                )
            }
        }
    }

    func request(_ request: PageOfAuthor.Close.Request) {
        presenter.present(PageOfAuthor.Close.Response())
    }
}

extension PageOfAuthorInteractor: PageOfAuthorDataStore {}
