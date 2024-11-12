//
//  SharedProfile.swift
//  Litera
//
//  Created by Oleg Prygunov on 17.09.2021.
//

public class SharedProfile {
    public static var shared = SharedProfile()

    public var profile: UserProfile?

    private init() {}
}
