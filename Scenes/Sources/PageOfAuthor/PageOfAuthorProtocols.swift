//
//  PageOfAuthorProtocols.swift
//  CollectionView
//
//  Created by Oleg Prygunov on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol PageOfAuthorBusinessLogic: AnyObject {
    func request(_ request: PageOfAuthor.Fetch.Request)
    func request(_ request: PageOfAuthor.Close.Request)
}

protocol PageOfAuthorPresentationLogic: AnyObject {
    func present(_ response: PageOfAuthor.Fetch.Response)
    func present(_ response: PageOfAuthor.Close.Response)
}

protocol PageOfAuthorDisplayLogic: AnyObject {
    func display(_ viewModel: PageOfAuthor.Fetch.ViewModel)
    func display(_ viewModel: PageOfAuthor.Close.ViewModel)
}

protocol PageOfAuthorRoutingLogic: AnyObject {
    func close()
}

protocol PageOfAuthorDataStore: AnyObject {}

protocol PageOfAuthorWorkingLogic: AnyObject {
    func fetch(_ completion: PageOfAuthor.FetchCompletion?)
}
