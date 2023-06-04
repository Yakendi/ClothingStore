//
//  CatalogPageViewController.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 01.06.2023.
//

import UIKit
import SnapKit

final class CatalogPageViewController: UIViewController {
    
    // MARK: - Private properties
    private let model: [CatalogPageModel] = [
    
        CatalogPageModel(categoryImage: UIImage(named: "menswear"), categoryName: "Мужская одежда"),
        CatalogPageModel(categoryImage: UIImage(named: "womenswear"), categoryName: "Женская одежда"),
        CatalogPageModel(categoryImage: UIImage(named: "jewelery"), categoryName: "Украшения"),
        CatalogPageModel(categoryImage: UIImage(named: "electronics"), categoryName: "Электроника")
        
    ]
    
    // MARK: - UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CatalogPageTableViewCell.self, forCellReuseIdentifier: CatalogPageTableViewCell.identifier)
        return tableView
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.title = "Каталог"
        
        setupViews()
    }
}

// MARK: - Setup views
private extension CatalogPageViewController {
    func setupViews() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableView data source and delegate
extension CatalogPageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CatalogPageTableViewCell.identifier, for: indexPath) as! CatalogPageTableViewCell
        let selectedRow = model[indexPath.row]
        cell.configure(selectedRow)
        return cell
    }
}
