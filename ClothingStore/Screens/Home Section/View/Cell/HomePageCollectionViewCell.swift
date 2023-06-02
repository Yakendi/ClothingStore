//
//  HomePageCollectionViewCell.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 02.06.2023.
//

import UIKit

final class HomePageCollectionViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
//    private let categoryImage: UIImageView = {
//        let image = UIImageView()
//        image.layer.cornerRadius = 4
//        image.contentMode = .scaleAspectFit
//        return image
//    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: (contentView.frame.size.width - 200), height: contentView.frame.size.width - 200)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        return collectionView
    }()
    
    // MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup views
private extension HomePageCollectionViewCell {
    func setup() {
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension HomePageCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        return cell
    }
}
