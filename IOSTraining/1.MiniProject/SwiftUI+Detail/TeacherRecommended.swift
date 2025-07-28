//
//  TeacherRecommended.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherRecommended: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView

    var body: some View {
        let recoTeachers: [TeacherThumbnail] = viewModel.recommendedTeachers ?? []

        VStack (alignment: .leading) {
            Text("Recommended tutors")
                .font(.headline)

            ScrollView(.horizontal) {
                HStack(spacing:10) {
                    ForEach(recoTeachers, id: \.self) { teacher in
                        TeacherCard(teacher: teacher)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    TeacherRecommended()
}
