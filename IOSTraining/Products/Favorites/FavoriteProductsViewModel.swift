//
//  FavoriteProductsViewModel.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/16/25.
//

import Foundation

class FavoriteProductsViewModel: ObservableObject {
    @Published var favoriteProducts: [Product] = []
    @Published var sort: String = ""

    func fetchFavoriteProducts (userId: Int, sort: String = "id") {

        NetworkManager.shared.fetchFavoriteProducts(userId: userId, sort: sort) { response in

            DispatchQueue.main.async {
                self.favoriteProducts = response.products
            }
        }

    }
}
