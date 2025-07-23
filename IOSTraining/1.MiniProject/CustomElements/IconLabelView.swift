//
//  IconLabelView.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct IconLabelView: View {
    var icon: String
    var label: String
    var type: String = "default"

    var body: some View {
        switch type {
        case "big":
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("\(label)")
                    .font(.caption)
            }
        case "vertical":
            VStack {
                Image(icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("\(label)")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)
        case "country":
            HStack {
//                OnlineImageView(imageURL: icon)
//                    .frame(width: 30, height: 20)
                Image(icon)
                    .resizable()
                    .frame(width: 20, height: 12)
                Text("\(label)")
                    .font(.caption)
            }
        default:
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 15, height: 15)
                Text("\(label)")
                    .font(.caption)
            }
        }
    }
}
