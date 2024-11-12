//
//  ViewController.swift
//  Litera
//
//  Created by Oleg Prygunov on 10.09.2021.
//

import UIKit
import Scenes

class ViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true, animated: false)
        viewControllers = [LaunchScreenBuilder.build()]
    }
}
