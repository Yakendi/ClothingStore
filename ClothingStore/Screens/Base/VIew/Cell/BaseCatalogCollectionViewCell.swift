//
//  BaseCatalogCollectionViewCell.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 05.06.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class BaseCatalogCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
    private let catalogItemImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bagThumbImage")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let catalogItemTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Толстовка Adidas"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private let catalogItemPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "8 990 ₽"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
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
    func configure() {
        
        // label
//        catalogItemImageView.kf.setImage(with: URL(string: model.image))
//        
//        // labels
//        catalogItemTitleLabel.text = model.title
//        catalogItemPriceLabel.text = String(model.price)
    }
}

// MARK: - Setup views
private extension BaseCatalogCollectionViewCell {
    func setupViews() {
        
        contentView.addSubview(catalogItemImageView)
        catalogItemImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.78)
        }
        
        contentView.addSubview(catalogItemTitleLabel)
        catalogItemTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.top.equalTo(catalogItemImageView.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        contentView.addSubview(catalogItemPriceLabel)
        catalogItemPriceLabel.snp.makeConstraints { make in
            make.leading.equalTo(catalogItemTitleLabel.snp.leading)
            make.top.equalTo(catalogItemTitleLabel.snp.bottom).offset(6)
            make.trailing.equalTo(catalogItemTitleLabel.snp.trailing)
        }
    }
}
