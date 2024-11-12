//
//  HeaderView.swift
//  
//
//  Created by Oleg Prygunov on 13.09.2021.
//

import UIKit

public final class HeaderView: View {
    public enum Action {
        case close
        case more
    }
    
    public var actionHandler: (Action) -> Void = { _ in }
    
    public struct Model {
        var textTitle: String?
        
        public init(textTitle: String? = nil) {
            self.textTitle = textTitle
        }
    }
    
    public var viewModel: Model = .init() {
        didSet {
            titleLabel.viewModel.text = viewModel.textTitle
        }
    }
    
    var isMoreButtonHidden: Bool? {
        didSet {
            moreButton.isHidden = isMoreButtonHidden ?? true
        }
    }
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.close)
                }
            ),
            for: .touchUpInside
        )
        view.tintColor = .textFirst
        view.setImage(
            UIImage(
                systemName: "chevron.backward",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: 18,
                    weight: UIImage.SymbolWeight.regular
                )
            ),
            for: .normal
        )
        view.setImage(
            UIImage(
                systemName: "chevron.backward",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: 16,
                    weight: UIImage.SymbolWeight.regular
                )
            ),
            for: .highlighted
        )
        return view
    }()
    
    private lazy var moreButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.more)
                }
            ),
            for: .touchUpInside
        )
        view.setImage(
            UIImage(
                named: "Ellipsisvertical", in: .module,
                with: UIImage.SymbolConfiguration(scale: .default)
            ),
            for: .normal
        )
        view.setImage(
            UIImage(
                named: "Ellipsisvertical", in: .module,
                with: UIImage.SymbolConfiguration(scale: .default)
            ),
            for: .highlighted
        )
        return view
    }()
    
    private var titleLabel: Label = {
        let view = Label(size: 18, font: .ceraBold)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "", textColor: .textFirst)
        return view
    }()
    
    public override func setupContent() {
        super.setupContent()
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(moreButton)
        heightAnchor ~= 44
    }
    
    public override func setupLayout() {
        super.setupLayout()
        
        backButton.centerYAnchor ~= centerYAnchor
        backButton.leftAnchor ~= leftAnchor + 14
        
        titleLabel.centerYAnchor ~= centerYAnchor
        titleLabel.centerXAnchor ~= centerXAnchor
        
        moreButton.centerYAnchor ~= centerYAnchor
        moreButton.rightAnchor ~= safeAreaLayoutGuide.rightAnchor - 26
    }
}
