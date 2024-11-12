//
//  SelectionGenresWorker.swift
//  Litera
//
//  Created by Oleg Prygunov on 09.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation
import SharedModels

final class SelectionGenresWorker: SelectionGenresWorkingLogic {
    func fetch(_ completion: SelectionGenres.Completion?) {
        let items: [SelectionGenres.Model.Item] = [
            .init(id: 0, genres: "Бизнес"),
            .init(id: 1, genres: "Историческая литература"),
            .init(id: 2, genres: "Путешествия"),
            .init(id: 3, genres: "Детективы"),
            .init(id: 4, genres: "Фэнтези"),
            .init(id: 5, genres: "Приключения"),
            .init(id: 6, genres: "Ужасы"),
            .init(id: 7, genres: "Поэзия"),
            .init(id: 8, genres: "Биографии"),
            .init(id: 9, genres: "Психология"),
            .init(id: 10, genres: "Нон-фикшн"),
            .init(id: 11, genres: "Современная российская проза"),
            .init(id: 12, genres: "Зарубежная проза"),
            .init(id: 13, genres: "Финансы"),
            .init(id: 14, genres: "Детская литература"),
            .init(id: 15, genres: "Комиксы"),
            .init(id: 16, genres: "Тайм-менеджмент"),
            .init(id: 17, genres: "Искусство"),
            .init(id: 18, genres: "Медицина"),
            .init(id: 19, genres: "Технологии"),
            .init(id: 20, genres: "Детская литература"),
            .init(id: 21, genres: "Комиксы"),
            .init(id: 22, genres: "Казахские сказки"),
            .init(id: 23, genres: "Казахское программирование"),
        ]
        
        completion?(.success(.init(genres: items, selectedGenres: [], userName: SharedProfile.shared.profile?.name ?? "")))
    }
    
    func apply(selectedGenres: Set<Int>, completion: SelectionGenres.EmptyCompletion?) {
        print("save genres: \(selectedGenres)")
        completion?()
    }
}
