//
//  YourNameWorker.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation
import SharedModels

final class YourNameWorker: YourNameWorkingLogic {

    func save(save: String, _ completion: YourName.SaveCompletion?) {
        guard let profile = SharedProfile.shared.profile else {
            return
        }
        SharedProfile.shared.profile = .init(
            name: save,
            email: profile.email,
            password: profile.password,
            userPhoto: profile.userPhoto
        )
        completion?()
    }
}
