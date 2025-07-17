//
//  RecommendedProductsSwiftUI.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/15/25.
//

import SwiftUI
import Kingfisher

struct RecommendedProductsSwiftUI: View {

    @EnvironmentObject var viewModel: ProductRecommendModelView
    @State private var selectedProduct: Product? = nil

    var body: some View {
        mainRecommendedProducts().environmentObject(viewModel)

    }

    private func mainRecommendedProducts() -> some View {

            VStack (alignment: .leading) {
                Text("You May Also Like")

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top) {
                        ForEach(viewModel.recommendedProducts, id: \.id) { currentProduct in
                            NavigationLink {
                                ProductDetailSwiftUI(
                                    productId: currentProduct.id
                                )
                            } label: {
                                    VStack(alignment: .leading, spacing: 8) {
                                        productImage(thumbnailImage: currentProduct.thumbnail)
                                        productDetails(for: currentProduct)

                                    }
                                    .padding()
                                    .frame(width: 150, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemGray6)))
                                    .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 2)
                            }


                        }
                    }
                    .padding()
                }
            }
            .padding()

    }

    @ViewBuilder
    private func productImage(thumbnailImage: String?) -> some View {
        if let thumbnail = thumbnailImage,
           let url = URL(string: thumbnail) {
            KFImage(url)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipped()
                .cornerRadius(10)
        } else {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 120, height: 120)
                .cornerRadius(10)
                .overlay(Text("No Image").foregroundColor(.gray))
        }
    }


    @ViewBuilder
    private func productDetails(for product: Product) -> some View {
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

//#Preview {
//    RecommendedProductsSwiftUI(viewModel: ProductRecommendModelView())
//}
