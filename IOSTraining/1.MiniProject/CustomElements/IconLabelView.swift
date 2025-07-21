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
                Text(label)
                    .font(.caption)
            }
        case "vertical":
            VStack {
                Image(icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(label)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)
        default:
            HStack {
                Image(icon)
                    .resizable()
                    .frame(width: 15, height: 15)
                Text(label)
                    .font(.caption)
            }
        }
    }
}
