//
//  RootControllerCoordinator.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 01.06.2023.
//

import UIKit

final class HomePageCoordinator: Coordinator {
    
    // MARK: - Public
    var navigationController: UINavigationController
    
    // MARK: - Constructor
    init() {
        self.navigationController = UINavigationController()
        
        start()
    }
    
    func start() {
        let controller = HomePageViewFactory.create()
        self.navigationController.setViewControllers([controller], animated: true)
    }
}
