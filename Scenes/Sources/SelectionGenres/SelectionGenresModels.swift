//
//  SelectionGenresModels.swift
//  Litera
//
//  Created by Oleg Prygunov on 09.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum SelectionGenres {
    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: RootViewModel
        }
    }
    
    enum Selected {
        struct Request {
            var index: Int
        }

        struct Response {
            var model: Model
        }

        struct ViewModel {
            var root: RootViewModel
        }
    }
    
    enum Continue {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }
    
    struct Model {
        struct Item: Hashable {
            let id: Int
            let genres: String
        }
        let genres: [Item]
        var selectedGenres: Set<Int>
        let userName: String
    }
    
    struct RootViewModel {
        struct Item: Hashable {
            let id: Int
            let genres: String
            let isSelected: Bool
        }
        
        enum Section: Hashable {
            case genres([Item])
        }
        
        let sections: [Section]
        let userName: String
        var canContinue: Bool
    }
    
    typealias Completion = (Result<Model,Error>) -> Void
    typealias EmptyCompletion = () -> Void
}
