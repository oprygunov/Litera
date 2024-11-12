//
//  LaunchScreenWorker.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class LaunchScreenWorker: LaunchScreenWorkingLogic {
    func fetch(_ completion: LaunchScreen.FetchCompletion?) {
        completion?(
            .success(
                .init(
                    didLogin: false
                )
            )
        )
    }
}
