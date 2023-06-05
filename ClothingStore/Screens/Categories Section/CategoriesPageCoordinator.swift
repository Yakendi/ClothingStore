//
//  CatalogCoordinator.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 01.06.2023.
//

import UIKit

final class CategoriesPageCoordinator: Coordinator {
     
    // MARK: - Public
    var navigationController = UINavigationController()
    
    // MARK: - Constructor
    init() {
        self.navigationController = UINavigationController()
        
        start()
    }
    
    func start() {
        let controller = CategoriesPageViewFactory.create()
        self.navigationController.setViewControllers([controller], animated: true)
    }
}
