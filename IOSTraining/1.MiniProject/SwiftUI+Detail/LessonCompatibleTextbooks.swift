//
//  LessonCompatibleTextbooks.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct LessonCompatibleTextbooks: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView
    @State private var showAll = false

    var body: some View {
        let dummyTextbooks = viewModel.teacher?.course_badge ?? []
        let columns = Array(repeating: GridItem(.flexible()), count: 4)
        VStack(spacing: 10) {
            Text("Compatible textbooks")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(showAll ? dummyTextbooks : Array(dummyTextbooks[0..<8]), id: \.self) { id in
                    TextbookCard(
                        title: "Textbook #\(id)",
                        imageUrl: viewModel.getRandomTBImage()
                    )
                }
            }
            .padding(0)

            Button(action: {
                showAll = !showAll
            }) {
                Text(showAll ? "Close" : "See All (\(dummyTextbooks.count))")
                    .font(.caption)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .padding()
    }
}

#Preview {
    LessonCompatibleTextbooks()
}
