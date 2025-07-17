//
//  AddedToCartSwiftUI.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/15/25.
//

import SwiftUI

struct AddedToCartSwiftUI: View {
    @EnvironmentObject var viewModel: ProductDetailModelView

    var body: some View {

            VStack(spacing: 16) {
                VStack(spacing: 16) {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.green)

                    Text("Added to Cart")
                        .font(.headline)
                        .foregroundColor(.black)


                    NavigationLink {
                        ShoppingCartSwiftUI()
                    } label: {

                            Text("Go to Cart")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 10)
                                .background(Color.blue)
                                .cornerRadius(8)

                    }
                }
            }
            .padding()
            .frame(width: 280)
            .background(Color.white.opacity(0.95))
            .cornerRadius(16)
            .shadow(radius: 20)
    }
}

//#Preview {
//    AddedToCartSwiftUI()
//}
