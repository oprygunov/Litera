

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var count: String? {
        didSet {
            countLabel.text = count
        }
    }
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.font = UIFont(name: "CeraPro-Bold", size: 18)
        view.textColor = UIColor(red: 0.204, green: 0.198, blue: 0.197, alpha: 1)
        view.heightAnchor.constraint(equalToConstant: 23).isActive = true
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return view
    }()
    
    private let countLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.font = UIFont(name: "PTRootUI-Regular", size: 12)
        view.textColor = UIColor(red: 0.318, green: 0.302, blue: 0.298, alpha: 1)
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Все", for: .normal)
        view.setTitleColor(UIColor(red: 0.557, green: 0.161, blue: 0.071, alpha: 1), for: .normal)
        view.titleLabel?.font = UIFont(name: "PTRootUI-Medium", size: 16.0)
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(countLabel)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 22),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            
            countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            countLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            countLabel.leftAnchor.constraint(equalTo: leftAnchor),
            countLabel.rightAnchor.constraint(equalTo: rightAnchor),

            
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            button.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            button.leftAnchor.constraint(equalTo: titleLabel.rightAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
