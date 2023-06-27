//
//  ServiceFactory.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 01.06.2023.
//

import Foundation

final class ServiceFactory {
    
    // MARK: - Singleton
    static let shared = ServiceFactory()
    
    // MARK: - Public
    let  networkService: NetworkService
    
    // MARK: - Constructor
    private init(networkService: NetworkService = .init()) {
        self.networkService = networkService
    }
    
    // MARK: - Requests
    func getAllProducts(completion: @escaping Handler<StoreModel>) {
        networkService.makeRequest(to: .allProducts(), completion: completion)
    }
    
    func getMensList(completion: @escaping Handler<StoreModel>) {
        networkService.makeRequest(to: .mens(), completion: completion)
    }
    
    func getWomensList(completion: @escaping Handler<StoreModel>) {
        networkService.makeRequest(to: .womens(), completion: completion)
    }
    
    func getJeweleryList(completion: @escaping Handler<StoreModel>) {
        networkService.makeRequest(to: .jewelery(), completion: completion)
    }
    
    func getElectronicsList(completion: @escaping Handler<StoreModel>) {
        networkService.makeRequest(to: .electronics(), completion: completion)
    }
}
