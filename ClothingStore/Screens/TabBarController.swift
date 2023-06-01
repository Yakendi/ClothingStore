//
//  TabBarController.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 01.06.2023.
//

import UIKit

enum TabBarItems {
    case home
    case catalog
    
    var title: String {
        switch self {
        case .home:
            return "Главная"
        case .catalog:
            return "Каталог"
        }
    }
    
    var image: UIImage {
        switch self {
        case .home:
            return UIImage(named: "homePage") ?? UIImage()
        case .catalog:
            return UIImage(named: "catalogPage") ?? UIImage()
        }
    }
}

class TabBarController: UITabBarController {

    // MARK: - Public
    let homePageViewController = HomePageCoordinator()
    let catalogPageViewController = CatalogPageCoordinator()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .systemBlue
        setupTabs()
    }
}

// MARK: - Setup tabs
extension TabBarController {
    func setupTabs() {
        homePageViewController.navigationController.tabBarItem = UITabBarItem(
            title: TabBarItems.home.title,
            image: TabBarItems.home.image,
            tag: 1
        )
        
        catalogPageViewController.navigationController.tabBarItem = UITabBarItem(
            title: TabBarItems.catalog.title,
            image: TabBarItems.catalog.image,
            tag: 2
        )
        
        setViewControllers([homePageViewController.navigationController, catalogPageViewController.navigationController], animated: true)
    }
}
