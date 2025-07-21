//
//  TextbookCard.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TextbookCard: View {
    var title: String
    var imageUrl: String

    var body: some View {
        VStack (alignment: .center){
            Image(imageUrl)
                .resizable()
                .scaledToFit()
                .clipped()

            Text(title)
                .font(.caption)
                .lineLimit(2)
                .frame(height: 34, alignment: .top)

            Button(action: {

            }) {
                Text("EVALUATE")
                    .font(.caption)
                    .frame(maxWidth: .infinity)

            }
            .padding(.vertical, 10)
            .border(Color.blue)
            .frame(maxWidth: .infinity)
        }
        .padding(0)
    }
}

#Preview {
    TextbookCard(title: "First Lesson", imageUrl: "flaticon_monitor")
}
