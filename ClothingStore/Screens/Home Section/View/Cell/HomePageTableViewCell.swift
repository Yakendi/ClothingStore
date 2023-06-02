//
//  HomePageTableViewCell.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 02.06.2023.
//

import UIKit
import SnapKit

enum TableViewSection: Int {
    case collectionViewCell
    case tableViewCell
}

final class HomePageTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
    private let pictureImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemRed
        image.contentMode = .scaleToFill
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Qwerty"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Qwerty"
        label.textColor = .systemGray
        return label
    }()
    
    // MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup views
private extension HomePageTableViewCell {
    
    func setup() {
        
        contentView.addSubview(pictureImageView)
        pictureImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(250)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(pictureImageView.snp.leading)
            make.top.equalTo(pictureImageView.snp.bottom).offset(10)
            make.trailing.equalTo(pictureImageView.snp.trailing)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(pictureImageView.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.trailing.equalTo(pictureImageView.snp.trailing)
            make.bottom.equalToSuperview()
        }
    }
}
