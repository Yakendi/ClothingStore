//
//  CatalogPageTableViewCell.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 04.06.2023.
//

import UIKit
import SnapKit

class CatalogPageTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
    private let wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let categoryNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        wrapperView.layer.masksToBounds = false
        wrapperView.layer.shadowOffset = CGSize(width: 0, height: 0)
        wrapperView.layer.shadowRadius = 4
        wrapperView.layer.shadowColor = UIColor.systemGray3.cgColor
        wrapperView.layer.shadowOpacity = 0.5
    }
    
    // MARK: - Configurator
    func configure(_ model: CatalogPageModel) {
        categoryImageView.image = model.categoryImage
        categoryNameLabel.text = model.categoryName
    }
}

// MARK: - Setup views
private extension CatalogPageTableViewCell {
    func setupViews() {
        contentView.addSubview(wrapperView)
        wrapperView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
        
        wrapperView.addSubview(categoryImageView)
        categoryImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(150)
        }
        
        wrapperView.addSubview(categoryNameLabel)
        categoryNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(categoryImageView.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
        }
    }
}
