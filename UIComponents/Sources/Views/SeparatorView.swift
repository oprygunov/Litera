//
//  SeparatorView.swift
//  
//
//  Created by Oleg Prygunov on 10.09.2021.
//

import UIKit

public class SeparatorView: View {
    public var color: UIColor? {
        didSet {
            backgroundColor = color
        }
    }
    
    public var cornerRadius: CGFloat? {
        didSet {
            layer.cornerRadius = cornerRadius ?? 0
        }
    }
    
    
    public init(heigth: CGFloat) {
        super.init(frame: .zero)
        heightAnchor.constraint(equalToConstant: heigth).isActive = true
        
    }
    
    public init(width: CGFloat) {
        super.init(frame: .zero)
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func setupContent() {
        super.setupContent()
        backgroundColor = .separator
    }
    
    public override func setupLayout() {
        super.setupLayout()
        
    }
}
