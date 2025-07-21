//
//  TeacherIntroduction.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import SwiftUI

struct TeacherIntroduction: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            VStack (alignment: .leading, spacing: 10) {
                Text("Introduction")
                    .font(.headline)
                Text("Welcome to Native Camp! This teacher is for test only of FDCI.. This teacher is for test only of FDCI.. This teacher is for test only of FDCI.. This teacher is for test only of FDCI.. This teacher is for test only of FDCI.. This teacher is for test only of FDCI.. This teacher is for test only of FDCI.. This teacher is for test only of FDCI.. This teacher is for test only of FDCI.. This teacher is for test only of FDCI.. This teacher is for test only of FDCI.. This teacher is for test only of FDCI..")
                    .font(.caption)
            }

            VStack (alignment: .leading, spacing: 10) {
                Text("Coins consumed")
                    .font(.headline)
                VStack (alignment: .leading) {
                    Text("Sudden Lesson: No coins required")
                        .font(.caption)
                    Text("Booked Lesson: 100 coins")
                        .font(.caption)
                    Text("(Callan Unlimited Option: Coins Returned After The Lesson")
                        .font(.caption)
                        .foregroundColor(Color.red)

                }
            }
        }
        .padding()
    }
}

#Preview {
    TeacherIntroduction()
}
