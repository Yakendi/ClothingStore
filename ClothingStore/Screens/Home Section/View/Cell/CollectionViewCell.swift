//
//  CollectionViewCell.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 02.06.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
    private let categoryImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 4
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .systemRed
        return image
    }()
    
    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CollectionViewCell {
    func setup() {
        contentView.addSubview(categoryImage)
        categoryImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(80)
        }
    }
}
