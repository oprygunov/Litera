//
//  Button.swift
//  Litera
//
//  Created by Vadim Mukhin on 14.12.2022.
//

import UIKit

public class PAButton: UIView {

    public var actionHandler: () -> Void = {} {
        didSet{
            button.addAction(
                UIAction(
                    handler: { _ in
                        self.actionHandler()
                    }
                ),
                for: .touchUpInside
            )
        }
    }
    
    public struct Model {
        var text: String
        var textSize: Int
        var textColor: UIColor?
        var cornerRadius: CGFloat
        var image: String
        var pointSize: CGFloat
        var colorButton: UIColor?
        var highlightedColor: UIColor
        var colorIcon: UIColor?
        var textWeight: String

        public init(
            text: String = "",
            textSize: Int = 10,
            textColor: UIColor? = nil,
            cornerRadius: CGFloat = 20,
            image: String = "",
            pointSize: CGFloat = 22,
            colorButton: UIColor? = nil,
            highlightedColor: UIColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1),
            colorIcon: UIColor? = nil,
            textWeight: String = "PTRootUI-Medium"
        ) {
            self.text = text
            self.textSize = textSize
            self.textColor = textColor
            self.cornerRadius = cornerRadius
            self.image = image
            self.pointSize = pointSize
            self.colorButton = colorButton
            self.highlightedColor = highlightedColor
            self.colorIcon = colorIcon
            self.textWeight = textWeight
        }
    }
    
    public var viewModel: Model = .init() {
        didSet {
            
            button.setImage(
                UIImage(
                    systemName: viewModel.image,
                    withConfiguration: UIImage.SymbolConfiguration(
                        pointSize: viewModel.pointSize,
                        weight: UIImage.SymbolWeight.regular
                    )
                ),
                for: .normal
            )
            button.setImage(
                UIImage(
                    systemName: viewModel.image,
                    withConfiguration: UIImage.SymbolConfiguration(
                        pointSize: viewModel.pointSize - 4,
                        weight: UIImage.SymbolWeight.regular
                    )
                ),
                for: .highlighted
            )
            button.setTitle(viewModel.text, for: .normal)
            button.setTitleColor(viewModel.textColor, for: .normal)
            button.titleLabel?.font = UIFont(name: viewModel.textWeight, size: CGFloat(viewModel.textSize))
            button.layer.cornerRadius = viewModel.cornerRadius
            button.tintColor = viewModel.colorIcon
            button.backgroundColor = viewModel.colorButton
            button.addAction(.init(handler: { _ in
                self.button.backgroundColor = self.viewModel.highlightedColor
            }), for: .touchDown)
            button.addAction(.init(handler: { _ in
                self.button.backgroundColor = self.viewModel.colorButton
            }), for: .touchUpInside)
            button.addAction(.init(handler: { _ in
                self.button.backgroundColor = self.viewModel.colorButton
            }), for: .touchUpOutside)
            
        }
    }
    
    var borderWidth: CGFloat? {
        didSet {
            button.layer.borderWidth = borderWidth ?? 0
        }
    }
    
    var buttonBorderColor: UIColor? {
        didSet {
            button.layer.borderColor = buttonBorderColor?.cgColor
        }
    }
    
    var isSelected: Bool = false {
        didSet {
            button.isSelected = isSelected
            if isSelected {
                button.backgroundColor = viewModel.highlightedColor
            }
            else{
                button.backgroundColor = viewModel.colorButton
            }
        }
    }

    private lazy var button: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // setup
        setupView()
        setupContent()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
    }
    
    func setupContent() {
        addSubview(button)
    }
    
    func setupLayout() {
        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
