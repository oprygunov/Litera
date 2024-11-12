//
//  PageOfAuthorModels.swift
//  CollectionView
//
//  Created by Oleg Prygunov on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum PageOfAuthor {
    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model
        }

        struct ViewModel {
            var root: RootViewModel
        }
    }

    enum Close {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    struct Model: Decodable {
        struct Author: Decodable {
            let image: String
            let name: String
            let text: String
        }
        
        let author: Author

        struct Books: Decodable {
            let id: Int
            let image: String
            let rating: Float
            let name: String
            let author: String
        }
        
        let books: [Books]
        let audioBooks: [Books]
        let similarBooks: [Books]
        
        struct SimilarAuthors: Decodable {
            let id: Int
            let image: String
            let name: String
            let countBooks: Int
        }
        
        let similarAuthors: [SimilarAuthors]
    }
    
    struct RootViewModel {
        struct Item: Hashable {
            let identifier: String
            
            let authorImage: String?
            let authorName: String?
            let authorText: String?
            
            let id: String?
            let bookImage: String?
            let bookRating: Float?
            let bookName: String?
            let bookAuthor: String?
            
            let similarAuthorImage: String?
            let similarAuthorName: String?
            let countBooks: String?
        }
        
        enum Section: Hashable {
            case author([Item])
            case books([Item])
            case audioBooks([Item])
            case similarBooks([Item])
            case similarAuthors([Item])
        }
        
        var sections: [Section]
    }
    
    typealias FetchCompletion = (Model) -> Void
}
