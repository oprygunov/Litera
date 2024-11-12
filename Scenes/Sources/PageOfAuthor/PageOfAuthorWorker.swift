//
//  PageOfAuthorWorker.swift
//  CollectionView
//
//  Created by Oleg Prygunov on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation
import Combine

final class PageOfAuthorWorker: PageOfAuthorWorkingLogic {
    
    var jsonBlob: Cancellable?
    
    func fetch(_ completion: PageOfAuthor.FetchCompletion?) {
        completion?(
            .init(
                author: .init(image: "author", name: "Юваль Ной Харари", text: "Юваль Ной Харари  —  44-летний военный историк, футуролог, писатель, автор международного бестселлера «Sapiens: краткая история человечества». Его книги переведены на 60 языков мира и разошлись тиражом в 27,5 млн экземпляров. Харари родился в Израиле, в городе Кирьят-Ата на севере Израиля. Он умел читать уже в три года, с восьми лет учился в классе для интеллектуально одар…"),
                books: [
                    .init(id: 1, image: "book1", rating: 4.7, name: "Sapiens: Краткая история человечества", author: "Юваль Ной Харари"),
                    .init(id: 2, image: "book2", rating: 4.9, name: "Homo Deus: Краткая история будущего", author: "Юваль Ной Харари"),
                    .init(id: 3, image: "book3", rating: 4.9, name: "21 урок для XXI века", author: "Юваль Ной Харари"),
                    .init(id: 4, image: "book4", rating: 4.7, name: "Special Operations in the Age of Chivalry", author: "Юваль Ной Харари")
                ],
                audioBooks: [
                    .init(id: 1, image: "audio1", rating: 4.7, name: "Sapiens: Краткая история человечества", author: "Юваль Ной Харари"),
                    .init(id: 2, image: "audio2", rating: 4.9, name: "Homo Deus: Краткая история будущего", author: "Юваль Ной Харари"),
                    .init(id: 3, image: "audio3", rating: 4.9, name: "21 урок для XXI века", author: "Юваль Ной Харари"),
                    .init(id: 4, image: "audio1", rating: 4.7, name: "Sapiens: Краткая история человечества", author: "Юваль Ной Харари"),
                    .init(id: 5, image: "audio2", rating: 4.9, name: "Homo Deus: Краткая история будущего", author: "Юваль Ной Харари"),
                ],
                similarBooks: [
                    .init(id: 1, image: "sbook1", rating: 4.5, name: "Ружья, микробы и сталь. История человеческих сообществ", author: "Джаред Даймонд"),
                    .init(id: 2, image: "sbook2", rating: 4.7, name: "Достающее звено. Книга вторая. Люди", author: "Станислав Дробышевский"),
                    .init(id: 3, image: "sbook3", rating: 4.9, name: "Хлопок одной ладонью", author: "Николай Кукушкин"),
                    .init(id: 4, image: "sbook1", rating: 4.5, name: "Ружья, микробы и сталь. История человеческих сообществ", author: "Джаред Даймонд"),
                    .init(id: 5, image: "sbook2", rating: 4.7, name: "Достающее звено. Книга вторая. Люди", author: "Станислав Дробышевский"),
                    .init(id: 6, image: "sbook3", rating: 4.9, name: "Хлопок одной ладонью", author: "Николай Кукушкин")
                ],
                similarAuthors: [
                    .init(id: 1, image: "author1", name: "Джаред Даймонд", countBooks: 5),
                    .init(id: 2, image: "author2", name: "Роберт Сапольски", countBooks: 4),
                    .init(id: 3, image: "author3", name: "Станислав Дробышевский", countBooks: 15),
                    .init(id: 4, image: "author4", name: "Николай Кукушкин", countBooks: 1)
                ]
            )

        )
    }
}
