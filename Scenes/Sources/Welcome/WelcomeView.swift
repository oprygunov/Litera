//
//  WelcomeView.swift
//  Litera
//
//  Created by Oleg Prygunov on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit
import UIComponents

final class WelcomeView: View {
    enum Action {
        case registration
        case login
    }
    
    var actionHandler: (Action) -> Void = { _ in }
    
    private let image: UIImageView = {
        let view = UIImageView()
        view.image = getImage(named: "Welcome")
        return view
    }()
    
    private let firstLabel: Label = {
        let view = Label(size: 28, font: .ceraBold)
        view.viewModel = .init(
            text: "Читай. Переводи.",
            textAlignment: .center,
            textColor: .buttonActive
        )
        return view
    }()
    
    private let secondLabel: Label = {
        let view = Label(size: 28, font: .ceraBold)
        view.viewModel = .init(
            text: "Создавай заметки",
            textAlignment: .center,
            textColor: .textFirst
        )
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            image,
            firstLabel,
            secondLabel
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 5
        return view
    }()
    
    private lazy var registrationButton: Button = {
        let view = Button(
            text: "Зарегистрироваться",
            style: .primary,
            size: .large
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = {
            self.actionHandler(.registration)
        }
        return view
    }()
    
    private lazy var loginButton: Button = {
        let view = Button(
            text: "Войти",
            style: .secondary,
            size: .large
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = {
            self.actionHandler(.login)
        }
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .backgroundGeneral
        addSubview(stackView)
        addSubview(registrationButton)
        addSubview(loginButton)
    }

    override func setupLayout() {
        super.setupLayout()
        
        stackView.topAnchor ~= safeAreaLayoutGuide.topAnchor + 110
        stackView.leftAnchor ~= leftAnchor + 52
        stackView.rightAnchor ~= rightAnchor - 52
        
        loginButton.leftAnchor ~= leftAnchor + 16
        loginButton.rightAnchor ~= rightAnchor - 16
        loginButton.bottomAnchor <= bottomAnchor - 16
        let bottom = loginButton.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        bottom.priority = .defaultHigh
        
        registrationButton.leftAnchor ~= leftAnchor + 16
        registrationButton.rightAnchor ~= rightAnchor - 16
        registrationButton.bottomAnchor ~= loginButton.topAnchor - 16
    }
}
