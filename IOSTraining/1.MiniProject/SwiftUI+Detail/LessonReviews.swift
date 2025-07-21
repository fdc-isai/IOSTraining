//
//  LessonReviews.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct LessonReviews: View {
    var body: some View {
        ForEach(0..<7, id: \.self){_ in
            LessonReviewCard(starCount: 5, date: "2025/12", message: "Good correction.")
        }
    }
}

#Preview {
    LessonReviews()
}
