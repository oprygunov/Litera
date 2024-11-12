//
//  SignUpRouter.swift
//  Litera
//
//  Created by Oleg Prygunov on 02.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class SignUpRouter {
    weak var viewController: SignUpViewController?
    var dataStore: SignUpDataStore?

    init(viewController: SignUpViewController, dataStore: SignUpDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension SignUpRouter: SignUpRoutingLogic {
    func continueWithApple() {
        
    }
    
    func continueWithGoogle() {
        
    }
    
    func createAccount() {
        viewController?.navigationController?.pushViewController(CreateAccountBuilder.build(), animated: true)
    }
    
    func termsOfUse() {
        
    }
    
    func privacyPolicy() {
        
    }
    
    func enterAccount() {
        viewController?.navigationController?.pushViewController(PageOfAuthorBuilder.build(), animated: true)
    }
}
