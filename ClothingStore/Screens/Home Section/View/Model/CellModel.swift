//
//  CellModel.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 03.06.2023.
//

import Foundation

enum CellModel {
    case collectionViewCell(_ model: [HomePageCollectionViewModel])
    case tableViewCell(_ model: [HomePageTableViewModel])
}
