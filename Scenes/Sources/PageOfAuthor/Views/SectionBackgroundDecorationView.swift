

import UIKit

class SectionBackgroundDecorationView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 1, green: 0.994, blue: 0.992, alpha: 1)
        layer.borderColor = UIColor(red: 0.922, green: 0.902, blue: 0.91, alpha: 1).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 15
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}
