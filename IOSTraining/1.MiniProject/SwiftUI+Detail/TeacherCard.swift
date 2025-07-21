//
//  TeacherCard.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherCard: View {
    var teacher: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image("user_mavuika")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .background(Color.white)
                .clipped()

            VStack(alignment: .leading, spacing: 10) {
                Text("Mavuika")
                    .font(.subheadline)

                HStack(spacing: 10) {
                    Image("flag_philippines")
                        .resizable()
                        .frame(width: 20, height: 12)

                    Text("Philippines")
                        .font(.caption2)
                }

                VStack(alignment: .leading, spacing: 5) {
                    IconLabelView(icon: "flaticon_star", label: "5.00")
                    IconLabelView(icon: "flaticon_monitor", label: "14575 times")
                    IconLabelView(icon: "flaticon_heart", label: "3731 people")
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
        }
        .frame(width: 120)
        .background(Color(.darkGray))
        .cornerRadius(10)
    }
}

#Preview {
    TeacherCard()
}
