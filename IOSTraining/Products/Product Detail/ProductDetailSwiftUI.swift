import SwiftUI
import Kingfisher

struct ProductDetailSwiftUI: View {
    var productId: Int
    @StateObject var viewModel: ProductDetailModelView = .init()
    @State private var goToCart = false

    var body: some View {
            ZStack {
                // main product view
                mainProductDetailView()


                // alerts/modals
                if viewModel.addedToCartAlert {
                    // overlay
                    Color.black.opacity(0.7)
                        .ignoresSafeArea()
                        .onTapGesture {
                            viewModel.addedToCartAlert = false
                            goToCart = false
                        }

                    AddedToCartSwiftUI( goToCart: $goToCart)
                }

            }
            .sheet(isPresented: $goToCart) {
                ShoppingCartSwiftUI()
            }
            .environmentObject(viewModel.recoProductsViewModel)


    }

    private func mainProductDetailView() -> some View {
        ScrollView{
                LazyVStack(spacing: 10) {
                    // product details
                    productMainImageView
                    productThumbnailsView
                    productBrandInfoView
                    productTitleAndDescriptionView
                    productPriceAndActionsView

                    // recommended products
                    RecommendedProductsSwiftUI()
                }
                .padding()

        }
        .onAppear {
            viewModel.fetchProduct(by: productId)
        }
    }

    private var productMainImageView: some View {

        ZStack (alignment: .topTrailing) {
            if let url = URL(string: viewModel.productImageURL) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray6))
            }

            favoriteView()
                .onTapGesture {
                    viewModel.isFavorite = !viewModel.isFavorite
                    print(viewModel.isFavorite)
                }

        }
    }

    private var productThumbnailsView: some View {
        LazyHStack(spacing: 10) {
            ForEach(viewModel.product?.images ?? [], id: \.self) { imageUrl in
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
                        viewModel.productImageURL = thumbnail
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

            Text(viewModel.product?.brand ?? "Brand")
                .foregroundColor(.gray)

            Spacer()

            Image("flaticon_star")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)

            Text(String(format: "%.2f", viewModel.product?.rating ?? 0.00))
                .foregroundColor(.gray)

            Image("flaticon_chart")
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.gray)

            Text("\(viewModel.product?.stock ?? 0)")
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var productTitleAndDescriptionView: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(viewModel.product?.title ?? "Product Title")
                .font(.system(size: 20, weight: .bold))

            Text(viewModel.product?.description ?? "Product Description")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var productPriceAndActionsView: some View {
        HStack {
            Text(String(format: "$%.2f", viewModel.product?.price ?? 0.00))
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.green)

            Spacer()

            HStack(spacing: 10) {
                Button(action: { viewModel.minusCartItemCount() }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.red)
                }

                Text("\(viewModel.productCartItemCount)")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)

                Button(action: { viewModel.addCartItemCount() }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.red)
                }

                Button(action: {
                    viewModel.addedToCartAlert = true
//                    viewModel.addToCart(
//                        userId: 1, // temp
//                        products: [
//                            (id: viewModel.product?.id ?? 0, quantity: viewModel.productCartItemCount)
//                        ]
//                    )
                }) {
                    Image("flaticon_addtocart2")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .background(Color(.systemGray6))
        .cornerRadius(60)
    }

    private func favoriteView() -> some View {
        if viewModel.isFavorite {
            Image("flaticon_heart_filled")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(10)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
                .scaleEffect(1.02)
                .padding([.top, .trailing], 5)
        } else {
            Image("flaticon_heart_empty")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(10)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
                .scaleEffect(1.02)
                .padding([.top, .trailing], 5)
        }
    }
}

//#Preview {
//    ProductDetailSwiftUI(productId: 1, viewModel: ProductDetailModelView())
//}

