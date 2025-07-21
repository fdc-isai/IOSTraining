//
//  TeacherVideoAndDetails.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import SwiftUI

struct TeacherVideoAndDetails: View {
    var body: some View {
        HStack (alignment: .top, spacing: 10) {
            TeacherImageOrVideo()
            TeacherDetailItems()
        }
        .padding()
    }

    private func TeacherImageOrVideo() -> some View {
        Image("profile_yelan")
            .resizable()
            .scaledToFit()
            .frame(width: .infinity)
    }

    private func TeacherDetailItems() -> some View {
        VStack (alignment: .leading) {
            IconLabelView(icon: "flaticon_monitor", label: "5 years 9 months")
            IconLabelView(icon: "flaticon_star", label: "3.43")
            IconLabelView(icon: "flaticon_woman", label: "4.92")
            IconLabelView(icon: "flaticon_chart", label: "10376 times")
            IconLabelView(icon: "flaticon_heart_filled", label: "1240 people")
            IconLabelView(icon: "flaticon_clock", label: "2025-07-18 (Fri)")

            IconLabelView(icon: "flaticon_friend", label: "Friendly", type: "big")
            IconLabelView(icon: "flaticon_book", label: "Speaks slearly", type: "big")
            IconLabelView(icon: "flaticon_ear", label: "Good listener", type: "big")

        }
        .padding()
    }


}

#Preview {
    TeacherVideoAndDetails()
}
