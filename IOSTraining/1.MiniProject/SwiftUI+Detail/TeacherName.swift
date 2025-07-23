//
//  TeacherName.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import SwiftUI

struct TeacherName: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView

    var body: some View {
        HStack (spacing: 10) {
            OnlineImageView(imageURL: viewModel.teacher?.images.main ?? "")
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            Circle()
                .fill(viewModel.teacher?.state_button != 6 ? Color.blue : Color.pink)
                .frame(width: 15, height: 15)

            VStack (alignment: .leading) {
                Text(viewModel.teacher?.name_eng ?? "")
                    .font(.headline)
                Text("(Age: \(viewModel.teacher?.age ?? 0))")
                    .font(.caption)
            }

            Spacer()

            Image(systemName: "ellipsis")
        }
        .padding(10)
    }
}
//
//#Preview {
//    TeacherName()
//}
