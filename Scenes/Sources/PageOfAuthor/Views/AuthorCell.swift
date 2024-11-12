//
//  AuthorCell.swift
//  
//
//  Created by Oleg Prygunov on 26.09.2021.
//

import UIKit
import UIComponents

class AuthorCell: UICollectionViewCell {
    var viewModel: PageOfAuthor.RootViewModel.Item? {
        didSet {
            content.nameLabel.text = viewModel?.authorName
            content.textLabel.text = viewModel?.authorText
            content.imageView.image = UIImage(named: viewModel?.authorImage ?? "")
        }
    }

    private lazy var content: AuthorCellContent = {
        let view = AuthorCellContent()
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
        content.imageView.image = nil
    }
}

private class AuthorCellContent: UIView {
    
    var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.heightAnchor.constraint(equalToConstant: 105).isActive = true
        view.widthAnchor.constraint(equalToConstant: 105).isActive = true
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.font = UIFont(name: "CeraPro-Bold", size: 18)
        view.textColor = UIColor(red: 0.204, green: 0.198, blue: 0.197, alpha: 1)
        view.heightAnchor.constraint(equalToConstant: 23).isActive = true
        return view
    }()
    
    let button: PAButton = {
        let view = PAButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Подписаться", textSize: 16, textColor: UIColor(red: 1, green: 0.994, blue: 0.992, alpha: 1), cornerRadius: 10, colorButton: UIColor(red: 0.557, green: 0.161, blue: 0.071, alpha: 1), highlightedColor: UIColor(red: 0.557, green: 0.161, blue: 0.071, alpha: 0.8))
        view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        view.widthAnchor.constraint(equalToConstant: 164).isActive = true
        return view
    }()
    
    var subTitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Мы будем присылать тебе уведомления\nо новых книгах автора в нашем каталоге"
        view.font = UIFont(name: "PTRootUI-Regular", size: 12)
        view.textColor = UIColor(red: 0.318, green: 0.302, blue: 0.298, alpha: 1)
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()
    
    var textLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "PTRootUI-Regular", size: 16)
        view.textColor = UIColor(red: 0.204, green: 0.198, blue: 0.197, alpha: 1)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
        
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [imageView, nameLabel, button, subTitleLabel, textLabel])
        view.axis = .vertical
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        view.setCustomSpacing(7.0, after: imageView)
        view.setCustomSpacing(16.0, after: nameLabel)
        view.setCustomSpacing(8.0, after: button)
        view.setCustomSpacing(24.0, after: subTitleLabel)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
