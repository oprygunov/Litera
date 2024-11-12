//
//  Label.swift
//  Litera
//
//  Created by Oleg Prygunov on 12.09.2021.
//

import UIKit

public class Label: View {
    public struct Model {
        var text: String?
        var textAlignment: NSTextAlignment?
        var textColor: UIColor?

        public init(text: String? = nil, textAlignment: NSTextAlignment? = nil, textColor: UIColor? = nil) {
            self.text = text
            self.textAlignment = textAlignment
            self.textColor = textColor
        }
    }

    public var viewModel: Model = .init() {
        didSet {
            label.text = viewModel.text
            label.textAlignment = viewModel.textAlignment ?? .left
            label.textColor = viewModel.textColor
        }
    }

    public var text: String? {
        didSet {
            label.text = text
        }
    }
    
    public var textSize: CGFloat? {
        didSet {
            label.font = UIFont(name: textFont?.string() ?? "", size: textSize ?? 17)
        }
    }

    public var textFont: Fonts? {
        didSet {
            label.font = UIFont(name: textFont?.string() ?? "", size: textSize ?? 17)
        }
    }
    
    public var textColor: UIColor? {
        didSet {
            label.textColor = textColor
        }
    }
    
    public var attributedText: NSAttributedString? {
        didSet {
            label.attributedText = attributedText
        }
    }
    
    public var isSelected: Bool? {
        didSet {
            if isSelected ?? true {
                let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
                let underlinedText = NSAttributedString(string: text ?? "", attributes: underlineAttribute)
                label.attributedText = underlinedText
            }
            else {
                let attributedText = NSAttributedString(string: text ?? "", attributes: [:])
                    label.attributedText = attributedText
            }
        }
    }

    public enum Fonts {
        case ptRootRegular
        case ptRootMedium
        case ceraBold
        case ceraMedium
        case sfRegular
        case sfSemibold
        
        func string() -> String {
            switch self {
            case .ptRootRegular:
                return "PTRootUI-Regular"
            case .ptRootMedium:
                return "PTRootUI-Medium"
            case .ceraBold:
                return "CeraPro-Bold"
            case .ceraMedium:
                return "CeraPro-Medium"
            case .sfRegular:
                return "SFProText-Regular"
            case .sfSemibold:
                return "SFProText-Semibold"
            }
        }
    }

    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()

   public init(size: CGFloat, font: Fonts) {
        super.init(frame: .zero)

       textFont = font
       textSize = size
       label.font = UIFont(name: font.string(), size: size)
       isUserInteractionEnabled = false

       addSubview(label)

       label.pinToSuperview()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func setContentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) {
        label.setContentHuggingPriority(priority, for: axis)
    }

    public override func setContentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) {
        label.setContentCompressionResistancePriority(priority, for: axis)
    }
}


