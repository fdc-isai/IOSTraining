//
//  TeacherIntroduction.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import SwiftUI

struct TeacherIntroduction: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView

    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            VStack (alignment: .leading, spacing: 10) {
                Text("Introduction")
                    .font(.headline)
                Text(viewModel.teacher?.message_translation ?? "")
                    .font(.caption)
            }

            VStack (alignment: .leading, spacing: 10) {
                Text("Coins consumed")
                    .font(.headline)
                VStack (alignment: .leading) {
                    Text("Sudden Lesson: \(viewModel.teacher?.coin != nil ? "\(viewModel.teacher?.coin ?? 0) coins" : "No coins required")")
                        .font(.caption)
                    Text("Booked Lesson: \(viewModel.teacher?.coin != nil ? "\(viewModel.teacher?.coin ?? 0) coins" : "No coins required")")
                        .font(.caption)

                    if ((viewModel.teacher?.callan_unlimited_flg) == 1) {
                        Text("(Callan Unlimited Option: Coins Returned After The Lesson")
                            .font(.caption)
                            .foregroundColor(Color.red)
                    }

                }
            }
        }
        .padding()
    }
}

#Preview {
    TeacherIntroduction()
}
