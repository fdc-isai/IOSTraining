//
//  TeacherDetailSwiftUI.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import SwiftUI

struct TeacherDetailSwiftUI: View {
    var teacherId: Int = 116763 // temp
    @StateObject var viewModel: TeacherDetailModelView = .init()
    @State var selectedTab = "Tutor's Profile"

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView (.vertical) {
                VStack (alignment: .leading) {
                    TeacherName()
                    TeacherVideoAndDetails()
                    TeacherButtons()
                    TeacherTabs(selectedTab: $selectedTab)

                    if (selectedTab == "Tutor's Profile") {
                        // TAB - Tutor's Profile
                        TeacherIntroduction()
                        TeacherFeatures()
                        TeacherHobbies()
                        TeacherWorkExperience()
                        TeacherGenerations()
                        TeacherGalleryPreview()
                        TeacherRecommended()
                    } else if (selectedTab == "Lesson Detail") {
                        // TAB - Lesson Detail
                        LessonAchievements()
                        LessonWithThisTutor()
                        LessonCompatibleTextbooks()

                    } else if (selectedTab == "Reviews") {
                        // TAB - Reviews
                        LessonRating()
                        LessonReviews()
                    }

                }
            }
            .padding()
        }
        .foregroundColor(.white)
        .onAppear {
            viewModel.fetchTeacherDetail(teacherId)
            viewModel.fetchRecommendedTeachers()
        }
        .environmentObject(viewModel)
    }


}


#Preview {
    TeacherDetailSwiftUI()
}
