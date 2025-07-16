//
//  ProductRecommendModelView.swift
//  Pods
//
//  Created by Isai Gesapine on 7/15/25.
//

import Foundation

class ProductRecommendModelView: ObservableObject {
    @Published var recommendedProducts: [Product] = []

    func fetchRecommendedProducts (category: String) {
        NetworkManager.shared.getProductsByCategory(category: category) { response in

            DispatchQueue.main.async {
                self.recommendedProducts = response.products
            }
        }
    }

}
