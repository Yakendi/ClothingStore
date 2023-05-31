//
//  AppCoordinator.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 31.05.2023.
//

import UIKit

class AppCoordinator: Coordinator {
    
    // MARK: - Public
    var window: UIWindow
    var navigationController = UINavigationController()
    
    // MARK: - Constructor
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Create
    func start() {
        let controller = ViewController()
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
}
