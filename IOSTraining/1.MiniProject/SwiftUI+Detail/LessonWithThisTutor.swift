//
//  LessonWithThisTutor.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct LessonWithThisTutor: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Lesson achievements")
                .font(.headline)
            VStack (alignment: .leading) {
                Text("Number of lessons taken: 42 times")
                    .font(.caption)
                Text("Last lesson: Jun 24, 2025 (Tue)")
                    .font(.caption)
            }

            HStack {
                Image("flaticon_book")
                    .resizable()
                    .frame(width: 40, height: 40)

                Text("Five min Discussion")
                    .font(.caption)
            }
        }
        .padding()
    }
}

#Preview {
    LessonWithThisTutor()
}
