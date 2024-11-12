//
//  PageOfAuthorPresenter.swift
//  CollectionView
//
//  Created by Oleg Prygunov on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class PageOfAuthorPresenter {
    weak var view: PageOfAuthorDisplayLogic?
    
    init(view: PageOfAuthorDisplayLogic) {
        self.view = view
    }
}

extension PageOfAuthorPresenter: PageOfAuthorPresentationLogic {
    func present(_ response: PageOfAuthor.Fetch.Response) {
        view?.display(
            PageOfAuthor.Fetch.ViewModel(
                root: .init(
                    sections: [
                        .author([
                            .init(
                                identifier: "author",
                                authorImage: response.model.author.image,
                                authorName: response.model.author.name,
                                authorText: response.model.author.text,
                                id: nil,
                                bookImage: nil,
                                bookRating: nil,
                                bookName: nil,
                                bookAuthor: nil,
                                similarAuthorImage: nil,
                                similarAuthorName: nil,
                                countBooks: nil
                            )
                        ]),
                        .books(response.model.books.map{ item in
                                .init(
                                    identifier: "book_\(item.id)",
                                    authorImage: nil,
                                    authorName: nil,
                                    authorText: nil,
                                    id: nil,
                                    bookImage: item.image,
                                    bookRating: item.rating,
                                    bookName: item.name,
                                    bookAuthor: item.author,
                                    similarAuthorImage: nil,
                                    similarAuthorName: nil,
                                    countBooks: nil
                                )
                        }),
                        .audioBooks(response.model.audioBooks.map{ item in
                                .init(
                                    identifier: "audiobook_\(item.id)",
                                    authorImage: nil,
                                    authorName: nil,
                                    authorText: nil,
                                    id: nil,
                                    bookImage: item.image,
                                    bookRating: item.rating,
                                    bookName: item.name,
                                    bookAuthor: item.author,
                                    similarAuthorImage: nil,
                                    similarAuthorName: nil,
                                    countBooks: nil
                                )
                        }),
                        .similarBooks(response.model.similarBooks.map{ item in
                                .init(
                                    identifier: "similarbook_\(item.id)",
                                    authorImage: nil,
                                    authorName: nil,
                                    authorText: nil,
                                    id: nil,
                                    bookImage: item.image,
                                    bookRating: item.rating,
                                    bookName: item.name,
                                    bookAuthor: item.author,
                                    similarAuthorImage: nil,
                                    similarAuthorName: nil,
                                    countBooks: nil
                                )
                        }),
                        .similarAuthors(response.model.similarAuthors.map{ item in
                                .init(
                                    identifier: "similarauthors_\(item.id)",
                                    authorImage: nil,
                                    authorName: nil,
                                    authorText: nil,
                                    id: nil,
                                    bookImage: nil,
                                    bookRating: nil,
                                    bookName: nil,
                                    bookAuthor: nil,
                                    similarAuthorImage: item.image,
                                    similarAuthorName: item.name,
                                    countBooks: "\(item.countBooks) книг"
                                )
                        })
                    ]
                )
            )
        )
    }

    func present(_ response: PageOfAuthor.Close.Response) {
        view?.display(PageOfAuthor.Close.ViewModel())
    }
}
