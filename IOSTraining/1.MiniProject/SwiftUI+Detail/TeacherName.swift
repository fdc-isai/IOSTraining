//
//  TeacherName.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import SwiftUI

struct TeacherName: View {
    var body: some View {
        HStack (spacing: 10) {
            Image("user_mavuika")
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            Circle()
                .fill(Color.blue)
                .frame(width: 15, height: 15)

            VStack (alignment: .leading) {
                Text("Mavuika")
                    .font(.headline)
                Text("(Age: 30)")
                    .font(.caption)
            }

            Spacer()

            Image(systemName: "ellipsis")
        }
        .padding(10)
    }
}

#Preview {
    TeacherName()
}
