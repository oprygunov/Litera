//
//  TextField.swift
//  Litera
//
//  Created by Oleg Prygunov on 14.09.2021.
//

import UIKit

public class TextField: UITextField {
    private let padding = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 70)

    public struct Model {
        var placeholderText: String?
        var isEyeIconHidden: Bool = true
        var isSecureText: Bool = false
    }

    public var viewModel: Model = .init() {
        didSet {
            placeholder = viewModel.placeholderText ?? "Введите ваш текст"
            rightView?.isHidden = viewModel.isEyeIconHidden
            isSecureTextEntry = viewModel.isSecureText
        }
    }

    public var enteredText: String? {
        didSet {
            self.text = enteredText
        }
    }

    public var isErrorState: Bool? {
        didSet {
            if isErrorState == true {
                borderColor = .error
            } else {
                borderColor = .buttonOutlineDisable
            }
        }
    }

    public var isEnabledField: Bool? {
        didSet {
            isEnabled = isEnabledField ?? true
        }
    }

    enum Action {
        case text(String)
        case editEnd(String)
    }

    var actionHandler: (Action) -> Void = {_ in }

    private lazy var eyeButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        view.tintColor = .textSecond
        view.addTarget(self, action: #selector(showButtonTapped), for: .touchUpInside)
        return view
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private override init(frame: CGRect) {
        super.init(frame: frame)

        translatesAutoresizingMaskIntoConstraints = false
        rightView = eyeButton
        rightViewMode = .always
        autocapitalizationType = .none
        textColor = .textFirst
        backgroundColor = .backgroundTabBar
        layer.borderColor = UIColor.buttonOutlineDisable?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "Ваш текст", attributes: [NSAttributedString.Key.foregroundColor: .textSecond ?? UIColor.lightGray])
        tintColor = .buttonActive
        font = UIFont(name: "SFProText-Regular", size: 16)
        addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.text(self.text ?? ""))
                }
            ),
            for: .editingChanged
        )
        addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.editEnd(self.text ?? ""))
                }
            ),
            for: .editingDidEndOnExit
        )
        heightAnchor ~= 44
    }

    @objc func showButtonTapped() {
        isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName: isSecureTextEntry ? "eye.slash.fill" : "eye"), for: .normal)
    }

    public override func becomeFirstResponder() -> Bool {
        let isFirstResponder = super.becomeFirstResponder()
        if isFirstResponder {
            eyeButton.tintColor = .textFirst
            borderColor = .buttonHover
        }
        return isFirstResponder
    }

    public override func resignFirstResponder() -> Bool {
        let isFirstResponder = super.resignFirstResponder()
        if isFirstResponder {
            eyeButton.tintColor = .textSecond
            layer.borderColor = UIColor.buttonOutlineDisable?.cgColor
        }
        return isFirstResponder
    }

    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rightFrame = super.rightViewRect(forBounds: bounds)
        rightFrame.origin.x -= 24
        return rightFrame
    }

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
}
