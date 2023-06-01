//
//  FavoritesPageCoordinator.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 01.06.2023.
//

import UIKit

final class FavoritesPageCoordinator: Coordinator {
    
    // MARK: - Public
    var navigationController = UINavigationController()
    
    // MARK: - Constructor
    init() {
        self.navigationController = UINavigationController()
        
        start()
    }
    
    func start() {
        let controller = FavoritesPageViewFactory.create()
        self.navigationController.setViewControllers([controller], animated: true)
    }
}
