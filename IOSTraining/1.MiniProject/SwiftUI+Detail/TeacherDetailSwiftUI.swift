//
//  TeacherDetailSwiftUI.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import SwiftUI

struct TeacherDetailSwiftUI: View {
    var teacherId: Int = 623 // temp
    @StateObject var viewModel: TeacherDetailModelView = .init()

    var body: some View {
        Text("Hello from TeacherDetailSwiftUI!")
            .onAppear(){
                print("here")
                viewModel.fetchTeacherDetail(teacherId)
            }
        /*
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView (.vertical) {
                VStack (alignment: .leading) {
                    TeacherName()
                    TeacherVideoAndDetails()
                    TeacherButtons()


                    // TAB - Tutor's Profile
                    TeacherIntroduction()
                    TeacherFeatures()
                    TeacherHobbies()
                    TeacherWorkExperience()
                    TeacherGenerations()
                    TeacherGalleryPreview()
                    TeacherRecommended()

                    // TAB - Lesson Detail
                    LessonAchievements()
                    LessonWithThisTutor()
                    LessonCompatibleTextbooks()


                    // TAB - Reviews
                    LessonRating()
                    LessonReviews()

                }

            }
            .padding()
        }
        .foregroundColor(.white)
         */
    }


}


#Preview {
    TeacherDetailSwiftUI()
}
