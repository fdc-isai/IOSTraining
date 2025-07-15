import SwiftUI
import Kingfisher

struct ProductDetailSwiftUI: View {
    var productId: Int?
    var product: Product? = Product(
        id: 1,
        title: "Gucci Bloom Eau de",
        description: "Gucci Bloom by Gucci is a floral and captivating fragrance, with notes of tuberose, jasmine, and Rangoon creeper. It's a modern and romantic scent.",
        brand: "Gucci",
        category: "fragrances",
        price: 12.99,
        thumbnail: "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/thumbnail.webp",
        stock: 235,
        rating: 4.9,
        discountPercentage: 10.0,
        images: [
            "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/1.webp",
            "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/2.webp",
            "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/3.webp"
        ]
    )

    @State private var productImageURL: String?
    @State private var productCount: Int = 1
    @State private var addedToCartAlert = false

    var body: some View {
        LazyVStack(spacing: 10) {
            productMainImageView
            productThumbnailsView
            productBrandInfoView
            productTitleAndDescriptionView
            productPriceAndActionsView
        }
        .padding()
        .onAppear {
            productImageURL = product?.thumbnail
        }
    }

    private var productMainImageView: some View {
        HStack {
            if let urlString = productImageURL, let url = URL(string: urlString) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
            }
        }
    }

    private var productThumbnailsView: some View {
        LazyHStack(spacing: 10) {
            ForEach(product?.images ?? [], id: \.self) { imageUrl in
                thumbnailImageView(thumbnailImage: imageUrl)
            }
        }
        .padding()
    }

    private func thumbnailImageView(thumbnailImage: String?) -> some View {
        HStack {
            if let thumbnail = thumbnailImage, let url = URL(string: thumbnail) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 115)
                    .background(Color(.systemGray6))
                    .onTapGesture {
                        productImageURL = thumbnail
                    }
            } else {
                Image(systemName: "p_mascara")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .background(Color(.systemGray6))
            }
        }
    }

    private var productBrandInfoView: some View {
        HStack(spacing: 10) {
            Image(systemName: "storefront")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)

            Text(product?.brand ?? "Brand")
                .foregroundColor(.gray)

            Spacer()

            Image("flaticon_star")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)

            Text(String(format: "%.2f", product?.rating ?? 0.00))
                .foregroundColor(.gray)

            Image("flaticon_chart")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)

            Text("\(product?.stock ?? 0)")
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var productTitleAndDescriptionView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(product?.title ?? "Product Title")
                .font(.system(size: 20, weight: .bold))

            Text(product?.description ?? "Product Description")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var productPriceAndActionsView: some View {
        HStack {
            Text(String(format: "$%.2f", product?.price ?? 0.00))
                .font(.system(size: 30, weight: .bold))

            Spacer()

            HStack(spacing: 10) {
                Button(action: { productCount -= 1 }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.red)
                }

                Text("\(productCount)")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)

                Button(action: { productCount += 1 }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.red)
                }

                Button(action: { addedToCartAlert = true }) {
                    Image("flaticon_addtocart2")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .alert(isPresented: $addedToCartAlert) {
                    Alert(title: Text("Added to Cart!"))
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .background(Color(.systemGray6))
        .cornerRadius(60)
    }
}

#Preview {
    ProductDetailSwiftUI()
}

