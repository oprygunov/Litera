//
//  SelectionGenresView.swift
//  Litera
//
//  Created by Oleg Prygunov on 09.10.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit
import UIComponents

final class SelectionGenresView: View {
    private typealias DataSource = UICollectionViewDiffableDataSource<SelectionGenres.RootViewModel.Section, SelectionGenres.RootViewModel.Item>
    private typealias CellRegistration = UICollectionView.CellRegistration<ChipCell, SelectionGenres.RootViewModel.Item>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<SelectionGenres.RootViewModel.Section, SelectionGenres.RootViewModel.Item>
    
    enum Action {
        case selected(Int)
        case continueButton
    }
    
    var actionHandler: (Action) -> Void = { _ in }
    
    var viewModel: SelectionGenres.RootViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }

            titleLabel.text = viewModel.userName
            continueButton.isEnabled = viewModel.canContinue
            
            var snapshot = Snapshot()
            snapshot.appendSections(viewModel.sections)
            viewModel.sections.forEach { section in
                switch section {
                case .genres(let items):
                    snapshot.appendItems(items, toSection: section)
                }
            }
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }
    
    private lazy var headerView: HeaderView = {
        let view = HeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textTitle: "Настройки аккаунта")
        return view
    }()
    
    private let titleLabel: Label = {
        let view = Label(size: 28, font: .ceraBold)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(
            text: "Привет, человек",
            textAlignment: .center,
            textColor: .textFirst
        )
        return view
    }()
    
    private let subTitleLabel: Label = {
        let view = Label(size: 16, font: .ptRootRegular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(
            text: "Выбери 3 интересных тебе жанра",
            textAlignment: .center,
            textColor: .textSecond
        )
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: SelectionGenresView.layout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .backgroundGeneral
        return view
    }()
    
    private lazy var dataSource: DataSource = {
        let cellRegistration = CellRegistration { [unowned self] cell, indexPath, item in
            cell.viewModel = .init(id: item.id, genres: item.genres, isSelected: item.isSelected)
        }
        
        let dataSource = DataSource(
            collectionView: collectionView
        ) { collectionView, indexPath, item -> UICollectionViewCell in
            switch indexPath.section {
            case 0:
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
            default:
                break
            }
            return UICollectionViewCell()
        }
        return dataSource
    }()
    
    private lazy var continueButton: Button = {
        let view = Button(text: "Продолжить", style: .primary, size: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = {
            self.actionHandler(.continueButton)
        }
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .backgroundGeneral
        addSubview(headerView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(collectionView)
        addSubview(continueButton)
    }

    override func setupLayout() {
        super.setupLayout()
        
        headerView.topAnchor ~= safeAreaLayoutGuide.topAnchor
        headerView.leftAnchor ~= leftAnchor
        headerView.rightAnchor ~= rightAnchor
        
        titleLabel.topAnchor ~= headerView.bottomAnchor + 29
        titleLabel.leftAnchor ~= leftAnchor
        titleLabel.rightAnchor ~= rightAnchor
        
        subTitleLabel.topAnchor ~= titleLabel.bottomAnchor + 5
        subTitleLabel.leftAnchor ~= leftAnchor
        subTitleLabel.rightAnchor ~= rightAnchor
        
        collectionView.topAnchor ~= subTitleLabel.bottomAnchor + 20
        collectionView.leftAnchor ~= leftAnchor
        collectionView.rightAnchor ~= rightAnchor
        collectionView.bottomAnchor <= bottomAnchor - 16
        let bottom = collectionView.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        bottom.priority = .defaultHigh
        
        continueButton.leftAnchor ~= leftAnchor + 16
        continueButton.rightAnchor ~= rightAnchor - 16
        continueButton.bottomAnchor <= bottomAnchor - 16
        let bottom2 = continueButton.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        bottom2.priority = .defaultHigh
    }
}

extension SelectionGenresView {
    static func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(32),
            heightDimension: .absolute(40)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(1)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.contentInsets = .init(top: 0, leading: 16, bottom: 64, trailing: 16)

        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension SelectionGenresView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected \(indexPath.item)")
        actionHandler(.selected(indexPath.item))
    }
}
