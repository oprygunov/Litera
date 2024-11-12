//
//  Chip.swift
//  
//
//  Created by Oleg Prygunov on 15.09.2021.
//

import UIKit

public class Chip: UIControl {
    
    public var actionHandler: () -> Void = {}
    
    public override var isSelected: Bool {
        didSet {
            if isSelected {
                label.textColor = .textChipSelected
                backgroundColor = .backgroundSelected
                layer.borderWidth = 0
            }
            else {
                label.textColor = .textChip
                backgroundColor = .backgroundTabBar
                layer.borderWidth = 1
            }
        }
    }
    
    public var text: String? {
        didSet {
            label.text = text
        }
    }
    
    private let label: Label = {
        let view = Label(size: 16, font: .ptRootRegular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .textChip
        return view
    }()
    
    public init () {
        super.init(frame: .zero)
        isUserInteractionEnabled = false
        backgroundColor = .backgroundTabBar
        layer.cornerRadius = 10
        layer.borderWidth = 1
        borderColor = .buttonBorder
        addAction()
        addSubview(label)
        label.heightAnchor ~= 20
        label.pinToSuperview(left: 16, top: 10, right: 16, bottom: 10)
    }
    
    private func addAction() {
        addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler()
                }
            ),
            for: .touchUpInside
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
