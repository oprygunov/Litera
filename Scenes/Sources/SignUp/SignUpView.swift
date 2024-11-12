//
//  SignUpView.swift
//  Litera
//
//  Created by Oleg Prygunov on 02.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit
import UIComponents

final class SignUpView: View {
    enum Action {
        case continueWithApple
        case continueWithGoogle
        case createAccount
        case termsOfUse
        case privacyPolicy
        case enterAccount
    }
    
    var actionHandler: (Action) -> Void = { _ in }
    
    private let image: UIImageView = {
        let view = UIImageView()
        view.image = getImage(named: "SignUp")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let titleLabel: Label = {
        let view = Label(size: 28, font: .ceraBold)
        view.textColor = .textFirst
        let text = "Зарегистрируйcя,\nчтобы продолжить"
        let attributedText = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        paragraphStyle.alignment = .center
        attributedText.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: text.count)
        )
        view.attributedText = attributedText
        view.heightAnchor ~= 71
        return view
    }()
    
    private lazy var appleButton: Button = {
        let view = Button(
            text: "Продолжить с Apple",
            style: .secondary,
            size: .large,
            icon: .apple,
            iconSpacing: 8
        )
        view.textColor = .textFirst
        view.textFont = .sfSemibold
        view.textSize = 17
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = {
            self.actionHandler(.continueWithApple)
        }
        return view
    }()
    
    private lazy var googleButton: Button = {
        let view = Button(
            text: "Продолжить с Google",
            style: .secondary,
            size: .large,
            icon: .google,
            iconSpacing: 8
        )
        view.textColor = .textFirst
        view.textFont = .sfSemibold
        view.textSize = 17
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = {
            self.actionHandler(.continueWithGoogle)
        }
        return view
    }()
    
    private let separatorView: SeparatorOrView = {
        let view = SeparatorOrView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var createAccauntButton: Button = {
        let view = Button(
            text: "Создать аккаунт",
            style: .primary,
            size: .large
        )
        view.textFont = .sfSemibold
        view.textSize = 17
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = {
            self.actionHandler(.createAccount)
        }
        return view
    }()
    
    private lazy var conditionsLabel: Label = {
        let view = Label(size: 12, font: .ptRootRegular)
        view.textColor = .textFirst
        let textPart1 = "Создавая аккаунт, ты  соглашаешься с "
        let textPart2 = "Условиями использования"
        let textPart3 = " и "
        let textPart4 = "Политикой конфиденциальности"
        let text = textPart1 + textPart2 + textPart3 + textPart4
        let attributedText = NSMutableAttributedString(string: text)
        let color = UIColor.buttonActive
        guard let color = color else { return view }
        attributedText.addAttribute(
            .foregroundColor,
            value: color,
            range: NSRange(
                location: textPart1.count,
                length: textPart2.count
            )
        )
        attributedText.addAttribute(
            .foregroundColor,
            value: color,
            range: NSRange(
                location: textPart1.count + textPart2.count + textPart3.count,
                length: textPart4.count
            )
        )
        view.attributedText = attributedText
        view.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        return view
    }()
    
    @objc private func handleTapOnLabel(_ recognizer: UITapGestureRecognizer) {
        let location = recognizer.location(in: conditionsLabel)
        let text = (conditionsLabel.attributedText?.string)!
        let textStorage = NSTextStorage(attributedString: conditionsLabel.attributedText!)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        let textContainer = NSTextContainer(
            size: CGSize(
                width: conditionsLabel.frame.size.width,
                height: conditionsLabel.frame.size.height
            )
        )
        layoutManager.addTextContainer(textContainer)

        var linkRange = NSRange(location: 0, length: 0)
        let index = layoutManager.characterIndex(
            for: location,
            in: textContainer,
            fractionOfDistanceBetweenInsertionPoints: nil
        )
        if let attributes = conditionsLabel.attributedText?.attributes(
            at: index,
            effectiveRange: &linkRange
        ) {
            let color = attributes[NSAttributedString.Key.foregroundColor] as? UIColor
            if color == .buttonActive {
                let textPart2 = "Условиями использования"
                let textPart4 = "Политикой конфиденциальности"
                if (text as NSString).substring(with: linkRange) == textPart2 {
                    print("1")
                } else if (text as NSString).substring(with: linkRange) == textPart4 {
                    print("2")
                }
            }
        }
    }
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alwaysBounceVertical = true
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private let accountLabel: Label = {
        let view = Label(size: 16, font: .ptRootRegular)
        view.viewModel = .init(text: "Уже есть аккаунт?", textAlignment: .left, textColor: .textFirst)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        return view
    }()
    
    private lazy var enterButton: Button = {
        let view = Button(text: "Войти")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = {
            self.actionHandler(.enterAccount)
        }
        return view
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            accountLabel,
            enterButton
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            image,
            titleLabel,
            appleButton,
            googleButton,
            separatorView,
            createAccauntButton,
            conditionsLabel,
            horizontalStackView
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.setCustomSpacing(0, after: image)
        view.setCustomSpacing(32, after: titleLabel)
        view.setCustomSpacing(24, after: conditionsLabel)
        view.spacing = 16
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        
        backgroundColor = .backgroundGeneral
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }

    override func setupLayout() {
        super.setupLayout()
        
        scrollView.topAnchor ~= safeAreaLayoutGuide.topAnchor
        scrollView.leftAnchor ~= leftAnchor
        scrollView.rightAnchor ~= rightAnchor
        scrollView.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        
        stackView.widthAnchor ~= scrollView.frameLayoutGuide.widthAnchor - 32
        stackView.topAnchor ~= scrollView.topAnchor + 110
        stackView.leftAnchor ~= scrollView.leftAnchor + 16
        stackView.rightAnchor ~= scrollView.rightAnchor - 16
        stackView.bottomAnchor <= scrollView.bottomAnchor - 16
        let bottom = stackView.bottomAnchor ~= scrollView.bottomAnchor
        bottom.priority = .defaultHigh
    }
}
