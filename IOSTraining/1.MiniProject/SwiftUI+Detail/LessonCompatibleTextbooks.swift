//
//  LessonCompatibleTextbooks.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct LessonCompatibleTextbooks: View {
    @State private var showAll = false

    var body: some View {
        let dummyTextbooks = [
            45,
            213,
            208,
            51,
            193,
            194,
            195,
            188,
            191,
            178,
            155,
            152,
            121,
            78,
            59,
            72,
            174,
            79,
            93,
            5,
            90,
            50,
            13,
            123,
            49,
            65,
            201,
            99,
            173,
            63,
            105,
            203,
            84,
            106,
            82,
            107,
            88,
            160,
            196,
            110,
            113,
            4,
            118,
            125,
            119,
            117,
            164,
            198
        ]
        let columns = Array(repeating: GridItem(.flexible()), count: 4)
        VStack(spacing: 10) {
            Text("Compatible textbooks")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(showAll ? dummyTextbooks : Array(dummyTextbooks[0..<8]), id: \.self) { id in
                    TextbookCard(
                        title: "Textbook #\(id)",
                        imageUrl: "flaticon_book"
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
