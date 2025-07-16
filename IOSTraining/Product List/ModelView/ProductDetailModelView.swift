//
//  ProductDetailModelView.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/15/25.
//

import SwiftUI

class ProductDetailModelView: ObservableObject {
    @Published var product: Product?
    @Published var productImageURL = ""
    @Published var productCartItemCount = 1
    @Published var addedToCartAlert = false

    @Published var selectedProduct: [Product] = []

    @Published var recoProductsViewModel: ProductRecommendModelView = .init()

    func fetchProduct (by id: Int) {
        NetworkManager.shared.getProductDetail(id: id) { response in

            DispatchQueue.main.async {
                self.product = response
                self.productImageURL = response.thumbnail ?? ""

                if let category = response.category {
                    self.recoProductsViewModel
                        .fetchRecommendedProducts(category: category)
                }

            }
        }
    }

    func addCartItemCount () {
        self.productCartItemCount += 1
    }
    
    func minusCartItemCount () {
        self.productCartItemCount = self.productCartItemCount > 1 ? self.productCartItemCount - 1 : 1
    }

    func addToCart (userId: Int = 1, products: [Product]) {
//        let products = products.map { $0.id }
//        NetworkManager.shared
//            .addToUserCart(
//                userId: userId,
//                products: products,
//                completion: {response in
//                    self.addedToCartAlert = response
//                }
//            )

    }

    
}
