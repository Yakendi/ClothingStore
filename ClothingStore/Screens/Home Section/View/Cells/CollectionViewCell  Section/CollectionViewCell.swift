//
//  CollectionViewCell.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 02.06.2023.
//

import UIKit
import SnapKit

final class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
    private let collectionImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let collectionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configurator
    func configure(_ model: HomePageCollectionViewModel) {
        collectionImage.image = model.image
        collectionLabel.text = model.title
    }
}

// MARK: - Setup views
private extension CollectionViewCell {
    func setupViews() {
        
        contentView.addSubview(collectionImage)
        collectionImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        collectionImage.addSubview(collectionLabel)
        collectionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(6)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
