//
//  ViewController.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 31.05.2023.
//

import UIKit
import SnapKit

final class HomePageViewController: UIViewController {
    
    // MARK: - Private properties
    private var models: [CellModel] = []
    
    // MARK: - UI
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomePageCollectionTableViewCell.self, forCellReuseIdentifier: HomePageCollectionTableViewCell.identifier)
        tableView.register(HomePageTableViewCell.self, forCellReuseIdentifier: HomePageTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "Главная"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setup()
        setupModels()
    }
    
    private func setupModels() {
        models.append(.collectionViewCell([
        
            HomePageCollectionViewModel(
                image: UIImage(named: "collectionFirstImage"),
                title: "С чем сочетать аксессуары?"
            ),
            HomePageCollectionViewModel(
                image: UIImage(named: "collectionSecondImage"),
                title: "Коллекции весна-лето"
            ),
            HomePageCollectionViewModel(
                image: UIImage(named: "collectionThirdImage"),
                title: "Новинки от Gucci"
            ),
            HomePageCollectionViewModel(
                image: UIImage(named: "collectionFourthImage"),
                title: "Базовый гардероб на каждый день"
            ),
            HomePageCollectionViewModel(
                image: UIImage(named: "collectionFifthImage"),
                title: "Лето - здесь!"
            )
        
        ]))
        
        models.append(.tableViewCell([
        
            HomePageTableViewModel(
                image: UIImage(named: "tableFirstImage"),
                title: "Новинки от Cartier",
                description: "Cвежая коллекция уже ждет вас"
            ),
            HomePageTableViewModel(
                image: UIImage(named: "tableSecondImage"),
                title: "Модные показы 2023",
                description: "Все самое интересное в нашей подборке"
            ),
            HomePageTableViewModel(
                image: UIImage(named: "tableThirdImage"),
                title: "Легкие платья на лето",
                description: "То, что так необходимо в эту жару!"
            ),
            HomePageTableViewModel(
                image: UIImage(named: "tableFourthImage"),
                title: "Gucci",
                description: "Новинки от главного модного дома Италии"
            ),
            HomePageTableViewModel(
                image: UIImage(named: "tableFifthImage"),
                title: "Аксессуары - наше все!",
                description: "Добавьте деталей в свой образ"
            )
        
        ]))
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch models[section] {
        case .collectionViewCell(_):
            return 1
        case .tableViewCell(let models):
            return models.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .collectionViewCell(let models):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomePageCollectionTableViewCell.identifier,
                for: indexPath
            ) as! HomePageCollectionTableViewCell
            cell.configure(models)
            return cell
            
        case .tableViewCell(let model):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: HomePageTableViewCell.identifier,
                for: indexPath
            ) as! HomePageTableViewCell
            let model = model[indexPath.row]
            cell.configure(model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .collectionViewCell(_):
            return view.frame.size.width - 210
        case .tableViewCell(_):
            return UITableView.automaticDimension
        }
    }
}
