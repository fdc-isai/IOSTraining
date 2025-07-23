//
//  LessonWithThisTutor.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct LessonWithThisTutor: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView

    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Lesson with this tutor")
                .font(.headline)
            VStack (alignment: .leading) {
                if viewModel.teacher?.self_lesson_now_count ?? 0 > 0 {
                    Text("Number of lessons taken: 42 times")
                        .font(.caption)
                    Text("Last lesson: \(viewModel.teacher?.last_login_date ?? "N/A")")
                        .font(.caption)

                    HStack {
                        Image("flaticon_book")
                            .resizable()
                            .frame(width: 40, height: 40)

                        Text("Five min Discussion")
                            .font(.caption)
                    }
                } else {
                    Text("You don't have any lesson with this instructor")
                        .font(.caption)
                }
            }


        }
        .padding()
    }
}

#Preview {
    LessonWithThisTutor()
}
