//
//  Button.swift
//  
//
//  Created by Oleg Prygunov on 15.09.2021.
//

import UIKit

public class Button: UIControl {
    var styleButton: Style?
    
    public var actionHandler: () -> Void = {}

    public var textSize: CGFloat? {
        didSet {
            title.textSize = textSize
        }
    }

    public var textFont: Label.Fonts? {
        didSet {
            title.textFont = textFont
        }
    }
    
    public var textColor: UIColor? {
        didSet {
            title.textColor = textColor
            image.tintColor = textColor
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            isEnabled ? setDefaultColor() : setDisabledColor()
        }
    }
    
    public enum Style {
        case primary
        case secondary
    }
    
    public enum Icon {
        case apple
        case google
        case book
        case headphone
    }
    
    public enum Size {
        case small
        case medium
        case large
    }
    
    private let title: Label = {
        let view = Label(size: 16, font: .ptRootMedium)
        return view
    }()
    
    private let image: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private let stack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.isUserInteractionEnabled = false
        return view
    }()
    
    public init(text: String, style: Style? = nil, size: Size? = nil, icon: Icon? = nil, iconSpacing: CGFloat? = nil) {
        super.init(frame: .zero)
        
        styleButton = style
        title.text = text
        
        setDefaultColor()
        
        switch icon {
        case nil:
            stack.addArrangedSubview(title)
        case .some(let icons):
            switch icons {
            case .apple:
                image.image = UIImage(systemName: "apple.logo")
            case .google:
                image.image = getImage(named: "Google-icon")
            case .book:
                image.image = UIImage(systemName: "book")
            case .headphone:
                image.image = UIImage(systemName: "headphones")
            }
            stack.addArrangedSubview(image)
            stack.addArrangedSubview(title)
            
            switch iconSpacing {
            case nil:
                break
            case .some(let spacing):
                stack.setCustomSpacing(spacing, after: image)
            }
        }
                
        addSubview(stack)
        
        switch size {
        case nil:
            stack.pinToSuperview()
        case .some(let widthButton):
            switch widthButton {
            case .small:
                widthAnchor ~= 164
            case .medium:
                widthAnchor ~= 231
            case .large:
                break
            }
            layer.cornerRadius = 10
            heightAnchor ~= 48
            stack.centerXAnchor ~= centerXAnchor
            stack.centerYAnchor ~= centerYAnchor
        }
        
        setEventColor(
            event: .touchDown,
            textUnderline: true,
            primaryColor: .buttonHover,
            secondaryColor: .buttonActive
        )
        
        setEventColor(
            event: .touchUpInside,
            textUnderline: false,
            primaryColor: .buttonActive,
            secondaryColor: .buttonBorder
        )
        
        setEventColor(
            event: .touchUpOutside,
            textUnderline: false,
            primaryColor: .buttonActive,
            secondaryColor: .buttonBorder
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setColor(background: UIColor? = nil, content: UIColor? = nil, border: UIColor? = nil, textUnderline: Bool? = nil) {
        
        if content != nil {
            title.textColor = content
            image.tintColor = content
        }
        
        if background != nil {
            backgroundColor = background
        }
        
        if border != nil {
            layer.borderWidth = 1
            layer.borderColor = border?.cgColor
        }
        
        guard let text = textUnderline else { return }
        if text {
            title.isSelected = true
        }
        else {
            title.isSelected = false
        }
    }
    
    private func setDefaultColor() {
        switch styleButton {
        case nil:
            setColor(
                content: .buttonActive
            )
        case .primary:
            setColor(
                background: .buttonActive,
                content: .separator
            )
        case .secondary:
            setColor(
                background: .buttonOutlineActive,
                content: .buttonActive,
                border: .buttonBorder
            )
        }
    }
    
    private func setDisabledColor() {
        switch styleButton {
        case nil:
            setColor(
                content: .buttonDisable
            )
        case .primary:
            setColor(
                background: .buttonDisable,
                content: .buttonOutlineDisable
            )
        case .secondary:
            setColor(
                background: .buttonOutlineDisable,
                content: .buttonDisable,
                border: .buttonBorder
            )
        }
    }
    
    private func setEventColor(event: UIControl.Event, textUnderline: Bool, primaryColor: UIColor?, secondaryColor: UIColor?) {
        addAction(
            UIAction(
                handler: { _ in
                    switch self.styleButton {
                    case nil:
                        self.setColor(textUnderline: textUnderline)
                    case .primary:
                        self.setColor(background: primaryColor)
                    case .secondary:
                        self.setColor(border: secondaryColor)
                    }
                    if event == .touchUpInside {
                        self.actionHandler()
                    }
                }
            ),
            for: event
        )
    }
    
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
            
        switch styleButton {
        case .primary:
            break
        case .secondary:
            layer.borderColor = UIColor.buttonBorder?.cgColor
        default:
            layer.borderColor = nil
        }
    }
}
