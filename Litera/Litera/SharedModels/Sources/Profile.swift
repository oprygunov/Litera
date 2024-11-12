//
//  Profile.swift
//  Litera
//
//  Created by Oleg Prygunov on 17.09.2021.
//

import Foundation

public struct UserProfile {
    public let name: String
    public let email: String
    public let password: String
    public let userPhoto: String

    public init(
        name: String,
        email: String,
        password: String,
        userPhoto: String) {
            self.name = name
            self.email = email
            self.password = password
            self.userPhoto = userPhoto
        }
}
