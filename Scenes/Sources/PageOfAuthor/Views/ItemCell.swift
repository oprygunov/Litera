//
//  ItemCell.swift
//
//
//  Created by Oleg Prygunov on 26.09.2021.
//

import UIKit
import UIComponents

class ItemCell: UICollectionViewCell {    
    var viewModel: PageOfAuthor.RootViewModel.Item? {
        didSet {
            content.titleLabel.text = viewModel?.bookName
            content.subTitleLabel.text = viewModel?.bookAuthor
            content.imageView.image = UIImage(named: viewModel?.bookImage ?? "")
            rating()
        }
    }

    private lazy var content: ItemCellContent = {
        let view = ItemCellContent()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(view)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            view.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            view.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
        return view
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}

private class ItemCellContent: UIView {

    let imageView: Image = {
        let view = Image()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.numberOfLines = 2
        view.font = UIFont(name: "PTRootUI-Medium", size: 16)
        return view
    }()
    
    var subTitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 1
        view.textAlignment = .left
        view.font = UIFont(name: "PTRootUI-Regular", size: 11)
        return view
    }()
    
    lazy var rating: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [imageView, rating, titleLabel, subTitleLabel])
        view.axis = .vertical
        view.setCustomSpacing(6.0, after: imageView)
        view.setCustomSpacing(5.0, after: rating)
        view.setCustomSpacing(4.0, after: titleLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.required, for: .vertical)
        view.setContentCompressionResistancePriority(.required, for: .vertical)
        return view
    }()
    
    let badgeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 16).isActive = true
        view.widthAnchor.constraint(equalToConstant: 38).isActive = true
        view.backgroundColor = UIColor(red: 1, green: 0.994, blue: 0.992, alpha: 1)
        view.layer.cornerRadius = 7
        return view
    }()
    
    let headphonesImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "headphones")?.withRenderingMode(.alwaysTemplate).withConfiguration(UIImage.SymbolConfiguration(pointSize: 10, weight: .regular))
        view.tintColor = UIColor(red: 0.204, green: 0.198, blue: 0.197, alpha: 1)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let bookImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "book")?.withRenderingMode(.alwaysTemplate).withConfiguration(UIImage.SymbolConfiguration(pointSize: 10, weight: .regular))
        view.tintColor = UIColor(red: 0.204, green: 0.198, blue: 0.197, alpha: 1)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    var slashLabel: UILabel = {
        let view = UILabel()
        view.text  = "/"
        view.textColor = UIColor(red: 0.204, green: 0.198, blue: 0.197, alpha: 1)
        view.textAlignment = .center
        view.font = UIFont(name: "PT-Root-UI_Regular", size: 20)
        return view
    }()
    
    lazy var badge: UIStackView = {
        let view = UIStackView(arrangedSubviews: [headphonesImage, slashLabel, bookImage])
        view.axis = .horizontal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.setCustomSpacing(2.0, after: headphonesImage)
        view.setCustomSpacing(2.0, after: slashLabel)
        
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        addSubview(badgeView)
        addSubview(badge)

        NSLayoutConstraint.activate([
            
            badge.topAnchor.constraint(equalTo: badgeView.topAnchor, constant: 4),
            badge.leftAnchor.constraint(equalTo: badgeView.leftAnchor, constant: 3),
            badge.rightAnchor.constraint(equalTo: badgeView.rightAnchor, constant: -3),
            badge.bottomAnchor.constraint(equalTo: badgeView.bottomAnchor, constant: -4),
            
            badgeView.rightAnchor.constraint(equalTo: imageView.rightAnchor, constant: -8),
            badgeView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -8),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ItemCell {
    func rating() {
        content.rating.arrangedSubviews.forEach { subview in
            subview.removeFromSuperview()
        }
        let fullStar = Int(viewModel?.bookRating ?? 0)
        let halfStar = (viewModel?.bookRating ?? 0) - Float(fullStar)
        for i in 0..<5 {
            
            let star = UIImageView()
            star.contentMode = .scaleAspectFit
            star.tintColor = UIColor(red: 1, green: 0.618, blue: 0.046, alpha: 1)
            
            if i < fullStar {
                star.image = UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate).withTintColor(.yellow).withConfiguration(UIImage.SymbolConfiguration(pointSize: 11.5, weight: .bold))

            }
            else if halfStar >= 0.5 {
                star.image = UIImage(systemName: "star.leadinghalf.filled")?.withRenderingMode(.alwaysTemplate).withTintColor(.yellow).withConfiguration(UIImage.SymbolConfiguration(pointSize: 11.5, weight: .bold))
            }
            else{
                star.image = UIImage(systemName: "star")?.withRenderingMode(.alwaysTemplate).withTintColor(.yellow).withConfiguration(UIImage.SymbolConfiguration(pointSize: 11.5, weight: .bold))
            }
            content.rating.addArrangedSubview(star)
        }
    }
}
