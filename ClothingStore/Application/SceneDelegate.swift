//
//  SceneDelegate.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 31.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var coordinator: AppCoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        coordinator = AppCoordinator(window: window)
        coordinator.start()
    }


}

