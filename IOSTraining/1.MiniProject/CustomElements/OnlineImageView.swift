//
//  OnlineImageView.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/21/25.
//

import SwiftUI
import Kingfisher

struct OnlineImageView: View {
    let imageURL: String?

    var body: some View {
        if let url = URL(string: imageURL ?? "https://placehold.co/600x400") {
            KFImage(url)
                .resizable()
                .scaledToFit()
        } else {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .foregroundColor(.gray)
        }
    }
}
