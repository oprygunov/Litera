//
//  LaunchScreenView.swift
//  Litera
//
//  Created by Oleg Prygunov on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit
import UIComponents

final class LaunchScreenView: View {
    private let welcomeLabel: Label = {
        let view = Label(size: 28, font: .ceraBold)
        view.textColor = .textFirst
        let text = "Добро пожаловать\nв мир книг"
        let attributedText = NSMutableAttributedString(string: text)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 9
        paragraphStyle.alignment = .center
        attributedText.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: text.count)
        )
        let color = UIColor.buttonActive
        guard let color = color else { return view }
        attributedText.addAttribute(
            .foregroundColor,
            value: color,
            range: NSRange(location: 22, length: text.count - 22)
        )
        view.attributedText = attributedText
        view.heightAnchor ~= 70
        return view
    }()

    
    private let subTitleLabel: Label = {
        let view = Label(size: 16, font: .ptRootRegular)
        view.viewModel = .init(
            text: "Доступно 50 000 книг для чтения бесплатно. С платной подпиской можно читать литературу\nна иностранных языках",
            textAlignment: .center,
            textColor: .textFirst
        )
        return view
    }()
    
    private let loadingView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 12
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [
            welcomeLabel,
            subTitleLabel,
            loadingView
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.setCustomSpacing(12, after: welcomeLabel)
        view.setCustomSpacing(32, after: subTitleLabel)
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        for _ in 0..<3 {
            let rectangle = UIView()
            rectangle.backgroundColor = .buttonActive
            rectangle.heightAnchor ~= 15
            rectangle.widthAnchor ~= 15
            rectangle.layer.cornerRadius = 5
            loadingView.addArrangedSubview(rectangle)
        }
        backgroundColor = .backgroundGeneral
        addSubview(stackView)
        animateRectangles()
    }

    override func setupLayout() {
        super.setupLayout()

        stackView.topAnchor ~= centerYAnchor - 52
        stackView.leftAnchor ~= leftAnchor + 52
        stackView.rightAnchor ~= rightAnchor - 52
    }
    
    func animateRectangles() {
        let rectangles = loadingView.arrangedSubviews

        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseInOut],
                       animations: {
            rectangles[0].transform = CGAffineTransform(scaleX: 1, y: 2)
            rectangles[0].layer.cornerRadius = 3
            rectangles[0].backgroundColor = .buttonDisable
        },
                       completion: { _ in
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           options: [.curveEaseInOut],
                           animations: {
                rectangles[0].transform = .identity
                rectangles[0].layer.cornerRadius = 5
                rectangles[0].backgroundColor = .buttonActive

                rectangles[1].transform = CGAffineTransform(scaleX: 1, y: 2)
                rectangles[1].layer.cornerRadius = 3
                rectangles[1].backgroundColor = .buttonDisable
            },
                           completion: { _ in
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               options: [.curveEaseInOut],
                               animations: {
                    rectangles[1].transform = .identity
                    rectangles[1].layer.cornerRadius = 5
                    rectangles[1].backgroundColor = .buttonActive
                    
                    rectangles[2].transform = CGAffineTransform(scaleX: 1, y: 2)
                    rectangles[2].layer.cornerRadius = 3
                    rectangles[2].backgroundColor = .buttonDisable
                },
                               completion: { _ in
                    UIView.animate(withDuration: 0.5,
                                   delay: 0,
                                   options: [.curveEaseInOut],
                                   animations: {
                        rectangles[2].transform = .identity
                        rectangles[2].layer.cornerRadius = 5
                        rectangles[2].backgroundColor = .buttonActive
                    },
                                   completion: { [weak self] _ in
                        self?.animateRectangles()
                    })
                })
            })
        })
    }
}
