//
//  ViewController.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 31.05.2023.
//

import UIKit

final class HomePageViewController: UIViewController {
    
    let sections = [TableViewSection.collectionViewCell, TableViewSection.tableViewCell]
    
    // MARK: - UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(HomePageCollectionViewCell.self, forCellReuseIdentifier: HomePageCollectionViewCell.identifier)
        tableView.register(HomePageTableViewCell.self, forCellReuseIdentifier: HomePageTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Главная"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setup()
    }
}

// MARK: - Setup views
private extension HomePageViewController {
    func setup() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - Table view data source and delegate
extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case TableViewSection.collectionViewCell.rawValue:
            return 5
        case TableViewSection.tableViewCell.rawValue:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionsType = sections[indexPath.section]
        var tableViewCell: UITableViewCell
        switch sectionsType {
        case .collectionViewCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomePageCollectionViewCell.identifier, for: indexPath)
            tableViewCell = cell
        case .tableViewCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomePageTableViewCell.identifier, for: indexPath)
            tableViewCell = cell
        }
        return tableViewCell
    }
}
