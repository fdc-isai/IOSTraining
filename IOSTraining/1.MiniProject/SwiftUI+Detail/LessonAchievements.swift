//
//  LessonAchievements.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct LessonAchievements: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView

    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Lesson achievements")
                .font(.headline)
            VStack (alignment: .leading) {
                Text("Sudden Lesson: \(viewModel.teacher?.lesson_now_count ?? 0) times")
                    .font(.caption)
                Text("Booked Lesson: \(viewModel.teacher?.reservation_lesson_count ?? 0) times")
                    .font(.caption)
            }
        }
        .padding()
    }
}

#Preview {
    LessonAchievements()
}
