//
//  LessonRating.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct LessonRating: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView
    
    var body: some View {
        VStack (alignment: .center, spacing: 10) {
            HStack {
                Spacer()

                HStack {
                    Text("Ratings: ")
                        .font(.caption)

                    Image("flaticon_star")
                        .resizable()
                        .frame(width: 12, height: 12)

                    Text("\(viewModel.teacher?.rating ?? 0.0)")
                        .font(.headline)
                }
                .padding()
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray),
                    alignment: .bottom
                )
                
                Spacer()
            }

            RatingsChart()

            Divider()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .background(Color.gray)

            LessonRatingTextbook()

            Divider()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .background(Color.gray)

        }
        .padding()

    }

    private func RatingsChart() -> some View {
        VStack (alignment: .leading, spacing: 10) {
            let ratings: [Int] = viewModel.teacher?.kids_ratings ?? []

            let ratingsGuide: [Int] = [
                5,
                4,
                3,
                2,
                1
            ]


            VStack (alignment: .leading) {
                ForEach(
                    ratings.indices,
                    id: \.self
                ) { index in
                    HStack{
                        HStack{
                            Image("flaticon_star")
                                .resizable()
                                .frame(width: 15, height: 15)

                            Text("\(ratingsGuide[index])")
                                .font(.caption)

                        }
                        .padding(5)
                        .frame(maxWidth: 60, maxHeight: 25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )

                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 8)

                                Rectangle()
                                    .fill(Color.white)
                                    .frame(
                                        width: geometry.size.width * CGFloat(ratings[index] / 100),
                                        height: 8
                                    )
                            }
                        }
                        .frame(height: 8)
                        .padding(.horizontal)


                        Text("\(ratings[index])")
                            .font(.caption)
                            .frame(maxWidth: 20, alignment: .trailing)
                    }
                }

            }
        }
        .padding()
    }

    private func LessonRatingTextbook() -> some View {
        HStack {
            Text("Textbook")
                .font(.caption)

            Spacer()

            Text("Not Specified")
                .font(.caption)

            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

#Preview {
    LessonRating()
}
