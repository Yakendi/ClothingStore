//
//  CartPageCoordinator.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 01.06.2023.
//

import UIKit

final class BagPageCoordinator: Coordinator {
    
    // MARK: - Public
    var navigationController: UINavigationController
    
    // MARK: - Constructor
    init() {
        self.navigationController = UINavigationController()
        
        start()
    }
    
    func start() {
        let controller = BagPageViewFactory.create()
        self.navigationController.setViewControllers([controller], animated: true)
    }
}
