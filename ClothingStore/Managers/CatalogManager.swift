//
//  CatalogManager.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 05.06.2023.
//

import Foundation

final class CatalogManager {
    
    // MARK: - Singleton
    static let shared = CatalogManager()
    
    // MARK: - Public
    var model: [StoreModel] = []
    
    // MARK: - Network service
    let network = ServiceFactory.shared
    
    // MARK: - Networking
//    func mensList() {
//        network.getMensList { [weak self] result in
//            guard let self = self else { return }
//            
//            switch result {
//            case .success(let data):
//                self.model = data
//            }
//        }
//    }
}
