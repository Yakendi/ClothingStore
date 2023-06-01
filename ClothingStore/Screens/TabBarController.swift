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
    case favorites
    case cart
    
    var title: String {
        switch self {
        case .home:
            return "Главная"
        case .catalog:
            return "Каталог"
        case .favorites:
            return "Избранное"
        case .cart:
            return "Корзина"
        }
    }
    
    var image: UIImage {
        switch self {
        case .home:
            return UIImage(named: "homePage") ?? UIImage()
        case .catalog:
            return UIImage(named: "catalogPage") ?? UIImage()
        case .favorites:
            return UIImage(named: "favoritesPage") ?? UIImage()
        case .cart:
            return UIImage(named: "cartPage") ?? UIImage()
        }
    }
}

class TabBarController: UITabBarController {

    // MARK: - Public
    let homePageViewController = HomePageCoordinator()
    let catalogPageViewController = CatalogPageCoordinator()
    let favoritesPageViewController = FavoritesPageCoordinator()
    let cartPageViewController = CartPageCoordinator()
    
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
        
        favoritesPageViewController.navigationController.tabBarItem = UITabBarItem(
            title: TabBarItems.favorites.title,
            image: TabBarItems.favorites.image,
            tag: 3
        )
        
        cartPageViewController.navigationController.tabBarItem = UITabBarItem(
            title: TabBarItems.cart.title,
            image: TabBarItems.cart.image,
            tag: 4
        )
        
        setViewControllers([
            homePageViewController.navigationController,
            catalogPageViewController.navigationController,
            favoritesPageViewController.navigationController,
            cartPageViewController.navigationController
        ], animated: true)
    }
}
