//
//  Product.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/11/25.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Product]
    let total: Int?
    let skip: Int?
    let limit: Int?
}

struct Product: Codable, Identifiable, Hashable {
    let id: Int
    let title: String?
    let description: String?
    let brand: String?
    let category: String?
    let price: Double?
    let thumbnail: String?
    let stock: Int?
    let rating: Double?
    let discountPercentage: Double?
    let images: [String]?
}
