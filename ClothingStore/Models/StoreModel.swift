//
//  StoreModel.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 01.06.2023.
//

import Foundation

struct StoreModel: Codable {
    let products: [Products]
}

struct Products: Codable {
    let id: String
    let title: String
    let price: Int
    let description: String
    let image: String
}
