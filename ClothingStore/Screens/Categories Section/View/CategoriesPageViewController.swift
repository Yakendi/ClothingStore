//
//  CatalogPageViewController.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 01.06.2023.
//

import UIKit
import SnapKit

final class CategoriesPageViewController: UIViewController {
    
    // MARK: - Private properties
    private let model: [CategoriesPageModel] = [
    
        CategoriesPageModel(categoryImage: UIImage(named: "menswear"), categoryName: "Мужская одежда"),
        CategoriesPageModel(categoryImage: UIImage(named: "womenswear"), categoryName: "Женская одежда"),
        CategoriesPageModel(categoryImage: UIImage(named: "jewelery"), categoryName: "Украшения"),
        CategoriesPageModel(categoryImage: UIImage(named: "electronics"), categoryName: "Электроника")
        
    ]
    
    // MARK: - UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CategoriesPageTableViewCell.self, forCellReuseIdentifier: CategoriesPageTableViewCell.identifier)
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
private extension CategoriesPageViewController {
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
extension CategoriesPageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesPageTableViewCell.identifier, for: indexPath) as! CategoriesPageTableViewCell
        let selectedRow = model[indexPath.row]
        cell.configure(selectedRow)
        return cell
    }
}
