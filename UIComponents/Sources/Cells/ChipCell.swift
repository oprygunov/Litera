//
//  ChipCell.swift
//  
//
//  Created by Oleg Prygunov on 15.09.2021.
//

import UIKit

public class ChipCell: UICollectionViewCell {
    public struct Item: Hashable {
        let id: Int
        let genres: String
        let isSelected: Bool
        
        public init(id: Int, genres: String, isSelected: Bool) {
            self.id = id
            self.genres = genres
            self.isSelected = isSelected
        }
    }

    public var viewModel: Item = .init(id: 0, genres: "", isSelected: false) {
        didSet {
            content.text = viewModel.genres
            content.isSelected = viewModel.isSelected
        }
    }

    private lazy var content: Chip = {
        let view = Chip()
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

    public override func prepareForReuse() {
        super.prepareForReuse()

    }
}
