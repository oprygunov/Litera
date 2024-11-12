//
//  Image.swift
//  
//
//  Created by Oleg Prygunov on 14.09.2021.
//

import UIKit

public class Image: UIImageView {
    
    private var heightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
    public override var image: UIImage? {
        didSet {
            removeConstraints([heightConstraint])
            
            guard let image = image else { return }

            heightConstraint = heightAnchor.constraint(equalTo: widthAnchor, multiplier: image.size.height/image.size.width)
            heightConstraint.isActive = true
        }
    }
}
