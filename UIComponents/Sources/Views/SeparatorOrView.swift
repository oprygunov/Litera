//
//  SeparatorOrView.swift
//  
//
//  Created by Oleg Prygunov on 11.09.2021.
//

import UIKit

public class SeparatorOrView: View {
    private let separatorLeft: SeparatorView = {
        let view = SeparatorView(heigth: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cornerRadius = 1
        return view
    }()
    
    private let label: Label = {
        let view = Label(size: 16, font: .ptRootRegular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(
            text: "или",
            textAlignment: .center,
            textColor: .textSecond
        )
        return view
    }()

    private let separatorRight: SeparatorView = {
        let view = SeparatorView(heigth: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.cornerRadius = 1
        return view
    }()
    
    public override func setupContent() {
        super.setupContent()
        
        addSubview(separatorLeft)
        addSubview(label)
        addSubview(separatorRight)
    }
    
    public override func setupLayout() {
        super.setupLayout()
        
        separatorLeft.centerYAnchor ~= label.centerYAnchor
        separatorLeft.leftAnchor ~= leftAnchor
        separatorLeft.rightAnchor ~= label.leftAnchor
        
        label.widthAnchor ~= 95
        label.topAnchor ~= topAnchor
        label.bottomAnchor ~= bottomAnchor
        label.centerXAnchor ~= centerXAnchor
        
        separatorRight.centerYAnchor ~= label.centerYAnchor
        separatorRight.leftAnchor ~= label.rightAnchor
        separatorRight.rightAnchor ~= rightAnchor
    }
}
