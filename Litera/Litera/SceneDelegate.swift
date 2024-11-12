//
//  SceneDelegate.swift
//  Litera
//
//  Created by Oleg Prygunov on 10.09.2021.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
    }
}
