//
//  YourNameModels.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation
import SharedModels

enum YourName {
    enum Fetch {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    enum NameText {
        struct Request {
            var name: String
        }

        struct Response {
            var name: String
            var hasNotEmpty: Bool
        }

        struct ViewModel {
            var root: RootViewModel
        }
    }

    enum SaveName {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    struct Model {
        var profile: UserProfile
    }

    struct RootViewModel {
        var name: String
        var isEnableButton: Bool?
    }

    typealias SaveCompletion = () -> Void
}
