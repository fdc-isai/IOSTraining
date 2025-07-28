//
//  LessonReviewCard.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct LessonReviewCard: View {
    var starCount: Int
    var date: String
    var message: String

    var body: some View {
        VStack (alignment: .leading, spacing: 10){
            HStack{
                ForEach(0..<starCount, id: \.self){_ in
                    Image(.flaticonStar)
                        .resizable()
                        .frame(width: 15, height: 15)
                }

                Spacer()

                Text(date)
                    .font(.caption)

            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 30)
            .background(Color(.darkGray))

            Text(message)
                .font(.caption)


            HStack( spacing: 10) {
                Image("flaticon_book")
                    .resizable()
                    .frame(width: 40, height: 40)

                Text("Daily News")
                    .font(.caption)
            }
        }
        .padding()
    }
}

#Preview {
    LessonReviewCard(starCount: 5, date: "2025/12", message: "Good correction.")
}
