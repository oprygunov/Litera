//
//  LoginTextFieldView.swift
//  Litera
//
//  Created by Oleg Prygunov on 12.09.2021.
//

import UIKit

public class LoginTextFieldView: UIView {
    public struct Model {
        var placeholderText: String?
        var isEyeIconHidden: Bool
        var isSecureText: Bool
        var textLabel: String?

        public init(placeholderText: String? = nil,
                    isEyeIconHidden: Bool = true,
                    isSecureText: Bool = false,
                    textLabel: String? = nil) {
            self.placeholderText = placeholderText
            self.isEyeIconHidden = isEyeIconHidden
            self.isSecureText = isSecureText
            self.textLabel = textLabel
        }
    }

    public var viewModel: Model = .init() {
        didSet {
            titleLabel.text = viewModel.textLabel
            loginTextField.viewModel.placeholderText = viewModel.placeholderText ?? "Введите ваш текст"
            loginTextField.viewModel.isEyeIconHidden = viewModel.isEyeIconHidden
            loginTextField.viewModel.isSecureText = viewModel.isSecureText
        }
    }

    public var text: String? {
        didSet {
            loginTextField.enteredText = text
        }
    }

    public var isErrorState: Bool? {
        didSet {
            loginTextField.isErrorState = isErrorState
        }
    }

    public var isEnabledField: Bool? {
        didSet {
            loginTextField.isEnabledField = isEnabledField ?? true
        }
    }

    public enum Action {
        case text(String)
        case editEnd(String)
    }

    public var actionHandler: (Action) -> Void = {_ in }

    private let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .textFirst
        view.font = UIFont(name: "SFProText-Regular", size: 16)
        return view
    }()

    private lazy var loginTextField: TextField = {
        let view = TextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = { action in
            switch action {
            case .text(let text):
                self.actionHandler(.text(text))
            case .editEnd(let text):
                self.actionHandler(.editEnd(text))
            }
        }
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .clear
        addSubview(loginTextField)
        addSubview(titleLabel)
        loginTextField.leftAnchor ~= leftAnchor
        loginTextField.rightAnchor ~= rightAnchor
        loginTextField.bottomAnchor ~= bottomAnchor
        titleLabel.leftAnchor ~= loginTextField.leftAnchor + 24
        titleLabel.topAnchor ~= topAnchor
        titleLabel.bottomAnchor ~= loginTextField.topAnchor - 11
    }
}
