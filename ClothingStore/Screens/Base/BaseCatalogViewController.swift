//
//  BaseCatalogViewController.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 05.06.2023.
//

import UIKit
import SnapKit

class BaseCatalogViewController: UIViewController {
    
    // MARK: - Private properties
    private var model: [StoreModel] = []
    
    // MARK: - UI
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width - 2) / 2, height: view.frame.size.width - 40)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BaseCatalogCollectionViewCell.self, forCellWithReuseIdentifier: BaseCatalogCollectionViewCell.identifier)
        return collectionView
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupViews()
    }
}

// MARK: - Setup views
private extension BaseCatalogViewController {
    func setupViews() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - Collection view data source and delegate
extension BaseCatalogViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BaseCatalogCollectionViewCell.identifier, for: indexPath) as! BaseCatalogCollectionViewCell
        return cell
    }
}
