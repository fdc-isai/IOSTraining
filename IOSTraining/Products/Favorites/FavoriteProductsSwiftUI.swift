//
//  FavoriteProductsSwiftUI.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/16/25.
//

import SwiftUI
import Kingfisher

struct FavoriteProductsSwiftUI: View {
    @StateObject var viewModel: FavoriteProductsViewModel = .init()

    var body: some View {
        ScrollView {
            sortingView()

            VStack(spacing: 16) {
                ForEach(viewModel.favoriteProducts) { product in
                    productDetail(product: product)
                }

                Divider()
                    .background(Color.gray)

            }
            .padding()
        }
        .onAppear() {
            viewModel.fetchFavoriteProducts(userId: 1)
        }
        .onReceive(viewModel.$sort) {  newValue in
            viewModel.fetchFavoriteProducts(userId: 1,sort: newValue)
        }
    }

    private func productDetail(product: Product) -> some View {
        HStack(spacing: 16) {
            if let url = URL(string: product.thumbnail ?? "") {
                KFImage(url)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipped()
                    .cornerRadius(10)
            }

            productDescription(for: product)

            Spacer()

            Image("flaticon_heart_filled")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(10)
        }
        .frame(alignment: .leading)
    }

    private func sortingView() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                Button("Sort by Title") {
                    viewModel.sort = "title"
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.orange.opacity(0.1))
                .cornerRadius(8)

                Button("Sort by Price") {
                    viewModel.sort = "price"
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)

                Button("Sort by Rating") {
                    viewModel.sort = "rating"
                }
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(Color.green.opacity(0.1))
                .cornerRadius(8)

                Spacer()
            }
            .padding(.horizontal)
        }
    }

    private func productDescription(for product: Product) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(product.title ?? "Untitled")
                .font(.headline)
                .lineLimit(2)

            HStack {
                Image(systemName: "storefront")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.gray)

                Text(product.brand ?? "Brand")
                    .foregroundColor(.gray)
                    .font(.caption)
                    .lineLimit(1)
            }

            HStack {
                Image("flaticon_star")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.gray)

                Text(String(format: "%.2f", product.rating ?? 0.00))
                    .foregroundColor(.gray)
                    .font(.caption)

                Image("flaticon_chart")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.gray)

                Text("\(product.stock ?? 0)")
                    .foregroundColor(.gray)
                    .font(.caption)
            }

            if let price = product.price {
                Text("$\(String(format: "%.2f", price))")
                    .font(.headline)
                    .foregroundColor(.green)
            }
        }

    }
}

#Preview {
    FavoriteProductsSwiftUI()
}
