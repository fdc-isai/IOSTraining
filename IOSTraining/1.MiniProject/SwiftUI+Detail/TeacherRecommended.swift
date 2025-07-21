//
//  TeacherRecommended.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherRecommended: View {
    var body: some View {
        let dummyTeachers = [
            "Stephen", "John", "Carmel", "Ylona", "Rey"]

        VStack (alignment: .leading) {
            Text("Recommended tutors")
                .font(.headline)


            ScrollView(.horizontal) {
                HStack(spacing:10) {
                    ForEach(dummyTeachers, id: \.self) { teacher in
                        TeacherCard(teacher: teacher)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    TeacherRecommended()
}
