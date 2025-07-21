//
//  TeacherWorkExperience.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherWorkExperience: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Work Experience")
                .font(.headline)
            VStack (alignment: .leading) {
                Text("2022-08-01 - 2022-10-01")
                    .font(.caption)
                    .foregroundColor(Color.gray)
                Text("Accounting")
                    .font(.caption)

            }
        }
        .padding()
    }
}

#Preview {
    TeacherWorkExperience()
}
