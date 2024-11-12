//
//  SelectionGenresInteractor.swift
//  Litera
//
//  Created by Oleg Prygunov on 09.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class SelectionGenresInteractor {
    private let presenter: SelectionGenresPresentationLogic
    private let worker: SelectionGenresWorkingLogic
    
    private var model: SelectionGenres.Model?

    init(presenter: SelectionGenresPresentationLogic, worker: SelectionGenresWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension SelectionGenresInteractor: SelectionGenresBusinessLogic {
    func request(_ request: SelectionGenres.Fetch.Request) {
        worker.fetch { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self.model = model
                case .failure:
                    break
                }
                guard let model = self.model else { return }
                self.presenter.present(SelectionGenres.Fetch.Response(model: model))
            }
        }
    }
    
    func request(_ request: SelectionGenres.Selected.Request) {
        guard var model = self.model else { return }
        if model.selectedGenres.contains(request.index) {
            model.selectedGenres.remove(request.index)
        }
        else if model.selectedGenres.count < 3 {
            model.selectedGenres.insert(request.index)
        }
        self.model?.selectedGenres = model.selectedGenres
        self.presenter.present(
            SelectionGenres.Selected.Response(
                model: .init(
                    genres: model.genres,
                    selectedGenres: model.selectedGenres,
                    userName: model.userName
                )
            )
        )
    }
    
    func request(_ request: SelectionGenres.Continue.Request) {
        guard let model = self.model else { return }
        worker.apply(selectedGenres: model.selectedGenres) {
            DispatchQueue.main.async {
                self.presenter.present(SelectionGenres.Continue.Response())
            }
        }
    }
}

extension SelectionGenresInteractor: SelectionGenresDataStore {}
