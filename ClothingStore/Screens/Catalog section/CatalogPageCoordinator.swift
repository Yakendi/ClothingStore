//
//  CatalogPageCoordinator.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 05.06.2023.
//

import UIKit

final class CatalogPageCoordinator: Coordinator {
    
    // MARK: - Public
    var navigationController: UINavigationController
    
    // MARK: - Constructor
    init() {
        self.navigationController = UINavigationController()
        
        start()
    }
    
    func start() {
        let controller = CatalogPageViewFactory.create()
        self.navigationController.setViewControllers([controller], animated: true)
    }
}
