//
//  CatalogPageTableViewCell.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 04.06.2023.
//

import UIKit
import SnapKit

class CategoriesPageTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
    private let wrapperView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
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
    
    // MARK: - Configurator
    func configure(_ model: CategoriesPageModel) {
        categoryImageView.image = model.categoryImage
        categoryNameLabel.text = model.categoryName
    }
}

// MARK: - Setup views
private extension CategoriesPageTableViewCell {
    func setupViews() {
        contentView.addSubview(wrapperView)
        wrapperView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.bottom.equalToSuperview()
        }
        
        wrapperView.addSubview(categoryImageView)
        categoryImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(220)
            make.width.equalToSuperview()
        }
        
        categoryImageView.addSubview(categoryNameLabel)
        categoryNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
