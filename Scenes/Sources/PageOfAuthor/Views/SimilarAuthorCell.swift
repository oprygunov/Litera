//
//  SimilarAuthorCell.swift
//
//
//  Created by Oleg Prygunov on 17.09.2021.
//

import UIKit
import Combine

class SimilarAuthorCell: UICollectionViewCell {
    private var imageRequest: Cancellable?
    
    var viewModel: PageOfAuthor.RootViewModel.Item? {
        didSet {
            content.titleLabel.text = viewModel?.similarAuthorName
            content.subTitleLabel.text = viewModel?.countBooks
            content.imageView.image = UIImage(named: viewModel?.similarAuthorImage ?? "")

        }
    }

    private lazy var content: SimilarAuthorCellContent = {
        let view = SimilarAuthorCellContent()
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

private class SimilarAuthorCellContent: UIView {

    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.setContentHuggingPriority(.required, for: .vertical)
        view.setContentCompressionResistancePriority(.required, for: .vertical)
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
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [imageView, titleLabel, subTitleLabel])
        view.axis = .vertical
        view.setCustomSpacing(6.0, after: imageView)
        view.setCustomSpacing(4.0, after: titleLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        NSLayoutConstraint.activate([
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
