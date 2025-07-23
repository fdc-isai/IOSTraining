//
//  LessonReviews.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct LessonReviews: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView

    var body: some View {
        if let userReview: Review = viewModel.teacher?.review {
            LessonReviewCard(
                starCount: Int(userReview.rating ?? "5") ?? 5,
                date: userReview.date ?? "",
                message: userReview.message ?? ""
            )
        }
    }
}

#Preview {
    LessonReviews()
}
