//
//  PageOfAuthorView.swift
//  CollectionView
//
//  Created by Oleg Prygunov on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class PageOfAuthorView: UIView {
    private typealias DataSource = UICollectionViewDiffableDataSource<PageOfAuthor.RootViewModel.Section, PageOfAuthor.RootViewModel.Item>
    private typealias AuthorCellRegistration = UICollectionView.CellRegistration<AuthorCell, PageOfAuthor.RootViewModel.Item>
    private typealias AuthorBooksCellRegistration = UICollectionView.CellRegistration<ItemCell, PageOfAuthor.RootViewModel.Item>
    private typealias SimilarAuthorCellRegistration = UICollectionView.CellRegistration<SimilarAuthorCell, PageOfAuthor.RootViewModel.Item>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<PageOfAuthor.RootViewModel.Section, PageOfAuthor.RootViewModel.Item>
    
    var viewModel: PageOfAuthor.RootViewModel? {
        didSet {
            var snapshot = Snapshot()
            guard let viewModel = viewModel else { return }
            snapshot.appendSections(viewModel.sections)
            viewModel.sections.forEach { section in
                switch section {
                case .author(let items):
                    snapshot.appendItems(items, toSection: section)
                case .books(let items):
                    snapshot.appendItems(items, toSection: section)
                case .audioBooks(let items):
                    snapshot.appendItems(items, toSection: section)
                case .similarBooks(let items):
                    snapshot.appendItems(items, toSection: section)
                case .similarAuthors(let items):
                    snapshot.appendItems(items, toSection: section)
                }
            }
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }

    enum Action {
        case close
    }

    var actionHandler: (Action) -> Void = { _ in }

    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = UIColor(red: 0.204, green: 0.198, blue: 0.197, alpha: 1)
        view.setImage(
            UIImage(
                systemName: "chevron.left",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: 22,
                    weight: UIImage.SymbolWeight.regular
                )
            ),
            for: .normal
        )
        view.setImage(
            UIImage(
                systemName: "chevron.left",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: 18,
                    weight: UIImage.SymbolWeight.regular
                )
            ),
            for: .highlighted
        )
        view.addAction(
            UIAction(
                handler: { [weak self] _ in
                    self?.actionHandler(.close)
                }
            ),
            for: .touchUpInside
        )
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: PageOfAuthor.layout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.showsVerticalScrollIndicator = false
        view.allowsMultipleSelection = true
        view.backgroundColor = UIColor(red: 0.988, green: 0.961, blue: 0.953, alpha: 1)
        return view
    }()
    
    private lazy var dataSource: DataSource = {
        let authorCellRegistration = AuthorCellRegistration { [unowned self] cell, indexPath, item in
            cell.viewModel = item
        }
        
        let authorBooksCellRegistration = AuthorBooksCellRegistration { [unowned self] cell, indexPath, item in
            cell.viewModel = item
        }
        
        let similarAuthorCellRegistration = SimilarAuthorCellRegistration { [unowned self] cell, indexPath, item in
            cell.viewModel = item
        }
        
        let headerRegistration = UICollectionView.SupplementaryRegistration
        <SectionHeaderView>(elementKind: "Header") {
            (view, string, indexPath) in
            guard let viewModel = self.viewModel else { return }
            switch indexPath.section {
            case 1:
                view.title = "Книги автора"
                view.count = "4 книги"
            case 2:
                view.title = "Аудиокниги автора"
                view.count = "5 аудиокниг"
            case 3:
                view.title = "Похожие книги"
                view.count = "6 книг"
            case 4:
                view.title = "Похожие авторы"
                view.count = "4 автора"
            default:
                break
            }
            
        }
        
        let dataSource = DataSource(
            collectionView: collectionView
        ) { collectionView, indexPath, item -> UICollectionViewCell in
            switch indexPath.section {
            case 0:
                return collectionView.dequeueConfiguredReusableCell(using: authorCellRegistration, for: indexPath, item: item)
            case 1:
                return collectionView.dequeueConfiguredReusableCell(using: authorBooksCellRegistration, for: indexPath, item: item)
            case 2:
                return collectionView.dequeueConfiguredReusableCell(using: authorBooksCellRegistration, for: indexPath, item: item)
            case 3:
                return collectionView.dequeueConfiguredReusableCell(using: authorBooksCellRegistration, for: indexPath, item: item)
            case 4:
                return collectionView.dequeueConfiguredReusableCell(using: similarAuthorCellRegistration, for: indexPath, item: item)
            default:
                break
            }
            return UICollectionViewCell()
        }
        dataSource.supplementaryViewProvider = { (view, kind, index) in
            return view.dequeueConfiguredReusableSupplementary(
                using: headerRegistration, for: index)
        }
        return dataSource
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0.988, green: 0.961, blue: 0.953, alpha: 1)
        
        addSubview(backButton)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 11),
            backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            
            collectionView.topAnchor.constraint(equalTo: self.backButton.bottomAnchor, constant: 11),
            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageOfAuthor {
    static func layout() -> UICollectionViewCompositionalLayout {
        //header and footer
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(74)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: "Header", alignment: .top)
        
        //background section
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(
            elementKind: "Background-Section")
        sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 0)
        
        //Author
        let itemAuthorSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(1.0)
        )
        let itemAuthor = NSCollectionLayoutItem(layoutSize: itemAuthorSize)
        
        let groupSizeAuthor = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(1.0)
        )
        let groupAuthor = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSizeAuthor,
            subitems: [itemAuthor]
        )
        
        let sectionAuthor = NSCollectionLayoutSection(group: groupAuthor)
        sectionAuthor.contentInsets = .init(top: 0, leading: 0, bottom: 24, trailing: 0)

        //Author Books
        let itemBookSize = NSCollectionLayoutSize(
            widthDimension: .absolute(100),
            heightDimension: .absolute(225)
        )
        let itemBook = NSCollectionLayoutItem(layoutSize: itemBookSize)
        
        let groupSizeBook = NSCollectionLayoutSize(
            widthDimension: .estimated(1),
            heightDimension: .estimated(1)
        )
        let groupBook = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSizeBook,
            subitems: [itemBook]
        )
        
        let sectionBooks = NSCollectionLayoutSection(group: groupBook)
        sectionBooks.orthogonalScrollingBehavior = .continuous
        sectionBooks.interGroupSpacing = 10
        sectionBooks.contentInsets = .init(top: 0, leading: 32, bottom: 40, trailing: 10)
        sectionBooks.decorationItems = [sectionBackgroundDecoration]
        sectionBooks.boundarySupplementaryItems = [sectionHeader]
        
        //Author AudioBooks
        let itemAudioBookSize = NSCollectionLayoutSize(
            widthDimension: .absolute(100),
            heightDimension: .absolute(185)
        )
        let itemAudioBook = NSCollectionLayoutItem(layoutSize: itemAudioBookSize)
        
        let groupSizeAudioBook = NSCollectionLayoutSize(
            widthDimension: .estimated(1),
            heightDimension: .estimated(1)
        )
        let groupAudioBook = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSizeAudioBook,
            subitems: [itemAudioBook]
        )
        
        let sectionAudioBooks = NSCollectionLayoutSection(group: groupAudioBook)
        sectionAudioBooks.orthogonalScrollingBehavior = .continuous
        sectionAudioBooks.interGroupSpacing = 10
        sectionAudioBooks.contentInsets = .init(top: 0, leading: 32, bottom: 40, trailing: 10)
        sectionAudioBooks.decorationItems = [sectionBackgroundDecoration]
        sectionAudioBooks.boundarySupplementaryItems = [sectionHeader]
        
        //Similar Author
        let itemSimilarAuthorSize = NSCollectionLayoutSize(
            widthDimension: .absolute(100),
            heightDimension: .absolute(162)
        )
        let itemSimilarAuthor = NSCollectionLayoutItem(layoutSize: itemSimilarAuthorSize)
        
        let groupSizeSimilarAuthor = NSCollectionLayoutSize(
            widthDimension: .estimated(1),
            heightDimension: .estimated(1)
        )
        let groupSimilarAuthor = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSizeSimilarAuthor,
            subitems: [itemSimilarAuthor]
        )
        
        let sectionSimilarAuthor = NSCollectionLayoutSection(group: groupSimilarAuthor)
        sectionSimilarAuthor.orthogonalScrollingBehavior = .continuous
        sectionSimilarAuthor.interGroupSpacing = 10
        sectionSimilarAuthor.contentInsets = .init(top: 0, leading: 32, bottom: 40, trailing: 10)
        sectionSimilarAuthor.decorationItems = [sectionBackgroundDecoration]
        sectionSimilarAuthor.boundarySupplementaryItems = [sectionHeader]

        
        let layout = UICollectionViewCompositionalLayout(
            sectionProvider: {
                sectionIndex, _  in
                switch sectionIndex {
                case 0:
                    return sectionAuthor
                case 1:
                    return sectionBooks
                case 2:
                    return sectionAudioBooks
                case 3:
                    return sectionBooks
                case 4:
                    return sectionSimilarAuthor
                default:
                    return sectionAuthor
                }
            }
        )
        layout.register(
            SectionBackgroundDecorationView.self,
            forDecorationViewOfKind: "Background-Section")
        return layout
    }
}

extension PageOfAuthorView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected \(indexPath.item)")
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("unselected \(indexPath.item)")
    }

    func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        return true
    }

    func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
        print("\(#function)")
    }

    func collectionViewDidEndMultipleSelectionInteraction(_ collectionView: UICollectionView) {
        print("\(#function)")
    }
}
