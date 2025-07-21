//
//  LessonAchievements.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct LessonAchievements: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Lesson achievements")
                .font(.headline)
            VStack (alignment: .leading) {
                Text("Sudden Lesson: 25417 times")
                    .font(.caption)
                Text("Booked Lesson: 3736 time")
                    .font(.caption)
            }
        }
        .padding()
    }
}

#Preview {
    LessonAchievements()
}
