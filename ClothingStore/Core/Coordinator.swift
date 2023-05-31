//
//  Coordinator.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 31.05.2023.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
