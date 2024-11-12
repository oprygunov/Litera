//
//  UIView+Border.swift
//  
//
//  Created by Oleg Prygunov on 13.09.2021.
//

import UIKit

public extension UIView {
    var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let cgColor = layer.borderColor else { return nil }
            return UIColor(cgColor: cgColor)
        }
    }
}
