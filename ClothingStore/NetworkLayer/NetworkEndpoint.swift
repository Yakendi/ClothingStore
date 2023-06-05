//
//  Endpoint.swift
//  ClothingStore
//
//  Created by Аслан Микалаев on 01.06.2023.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "647defafaf984710854aa3ba.mockapi.io"
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}

extension Endpoint {
    static func allProducts() -> Self {
        Endpoint(path: "/products")
    }
    
    static func mens() -> Self {
        Endpoint(path: "/category/mensclothing")
    }
    
    static func womens() -> Self {
        Endpoint(path: "/category/women's clothing")
    }
    
    static func jewelery() -> Self {
        Endpoint(path: "/category/jewelery")
    }
    
    static func electronics() -> Self {
        Endpoint(path: "/category/electronics")
    }
}
