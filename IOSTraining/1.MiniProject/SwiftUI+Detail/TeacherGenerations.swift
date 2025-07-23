//
//  TeacherGenerations.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherGenerations: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView

    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Generation chooosing this instructor")
                .font(.headline)

            let generationPercentage: [Double] = viewModel.teacher?.generation ?? []

            let generationList: [String] = [
                "-9 years",
                "10s",
                "20s",
                "30s",
                "40s",
                "50s",
                "60s~"
            ]


            VStack (alignment: .leading) {
                ForEach(
                    generationPercentage.indices,
                    id: \.self
                ) { index in
                    HStack{
                        Text(generationList[index])
                            .font(.caption)
                            .frame(maxWidth: 50)

                        GeometryReader { geometry in
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 8)

                                Rectangle()
                                    .fill(Color.white)
                                    .frame(
                                        width: geometry.size.width * CGFloat(generationPercentage[index] / 100),
                                        height: 8
                                    )
                            }
                        }
                        .frame(height: 8)
                        .padding(.horizontal)


                        Text(String(format: "%.2f%%", generationPercentage[index]))
                            .font(.caption)
                            .frame(maxWidth: 50, alignment: .trailing)
                    }
                }

            }
        }
        .padding()
    }
}

#Preview {
    TeacherGenerations()
}
