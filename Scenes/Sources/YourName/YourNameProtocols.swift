//
//  YourNameProtocols.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol YourNameBusinessLogic: AnyObject {
    func request(_ request: YourName.Fetch.Request)
    func request(_ request: YourName.NameText.Request)
    func request(_ request: YourName.SaveName.Request)
}

protocol YourNamePresentationLogic: AnyObject {
    func present(_ response: YourName.Fetch.Response)
    func present(_ response: YourName.NameText.Response)
    func present(_ response: YourName.SaveName.Response)
}

protocol YourNameDisplayLogic: AnyObject {
    func display(_ viewModel: YourName.Fetch.ViewModel)
    func display(_ viewModel: YourName.NameText.ViewModel)
    func display(_ viewModel: YourName.SaveName.ViewModel)
}

protocol YourNameRoutingLogic: AnyObject {
    func save()
}

protocol YourNameDataStore: AnyObject {}

protocol YourNameWorkingLogic: AnyObject {
    func save(save: String, _ completion: YourName.SaveCompletion?)
}
