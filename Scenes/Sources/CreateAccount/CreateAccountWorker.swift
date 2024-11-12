//
//  CreateAccountWorker.swift
//  Litera
//
//  Created by Oleg Prygunov on 20.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation
import SharedModels

final class CreateAccountWorker: CreateAccountWorkingLogic {
    var profileNew: UserProfile = .init(
        name: "",
        email: "",
        password: "",
        userPhoto: ""
    )

    private var profile: UserProfile {
        get {
            guard let new = SharedProfile.shared.profile else {
                SharedProfile.shared.profile = profileNew
                return profileNew
            }
            return new
        }
        set {
            SharedProfile.shared.profile = newValue
        }
    }

    func create(mail: String, password: String, _ completion: CreateAccount.SaveCompletion?) {
        SharedProfile.shared.profile = .init(
            name: "",
            email: mail,
            password: password,
            userPhoto: ""
        )
        completion?()
    }
}
