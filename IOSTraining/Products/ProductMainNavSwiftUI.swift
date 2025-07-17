//
//  ProductMainNavSwiftUI.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/17/25.
//

import SwiftUI

struct ProductMainNavSwiftUI: View {
    var selectedTab: String = "all" // temp
    var body: some View {
            HStack(spacing: 20) {

                Button(action: {
//                    if let nav = UIApplication.topViewController()?.navigationController {
//                        nav.pushViewController(ProductListViewController(), animated: true)
//                    }
                    UIApplication
                        .topViewController()?.navigationController?
                        .popToRootViewController(animated: true)
                }) {
                    Text("All")
                        .fontWeight(.medium)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                        .background(
                            selectedTab == "all" ? Color(.blue): Color.clear
                        )
                        .foregroundColor(
                            selectedTab == "all" ? Color(.white): Color.blue
                        )
                        .cornerRadius(10)

                }



                NavigationLink {
                    FavoriteProductsSwiftUI()
                } label: {
                    Text("Favorites")
                        .fontWeight(.medium)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                        .background(selectedTab == "favorite" ? Color(.blue): Color.clear)
                        .foregroundColor(
                            selectedTab == "favorite" ? Color(.white): Color.blue
                        )
                        .cornerRadius(10)
                }



            }
            .padding()
    }
}

//#Preview {
//    ProductMainNavSwiftUI()
//}
