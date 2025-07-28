//
//  TeacherVideoAndDetails.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import SwiftUI

struct TeacherVideoAndDetails: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView

    var body: some View {
        HStack (alignment: .top, spacing: 10) {
            TeacherImageOrVideo()
            TeacherDetailItems()
        }
        .padding()
    }

    private func TeacherImageOrVideo() -> some View {
        OnlineImageView(imageURL: viewModel.teacher?.images.main ?? "")
    }

    private func TeacherDetailItems() -> some View {
        VStack (alignment: .leading) {
            IconLabelView(icon: "flag_unknown", label: viewModel.teacher?.nationality_name ?? "", type: "country")
            IconLabelView(icon: "flaticon_monitor", label: viewModel.teacher?.instructor_history ?? "")
            IconLabelView(icon: "flaticon_star", label: "\(viewModel.teacher?.rating ?? 0.00)")
            IconLabelView(icon: "flaticon_woman", label: "\(viewModel.teacher?.kids_rating ?? 0.00)")
            IconLabelView(icon: "flaticon_chart", label: "\(viewModel.teacher?.lessons ?? 0) times")
            IconLabelView(icon: "flaticon_heart_filled", label: "\(viewModel.teacher?.favorite_count ?? 0) people")
            IconLabelView(icon: "flaticon_clock",label: viewModel.teacher?.getLastLoginDate() ?? "")

            // dummy for now
            IconLabelView(icon: "flaticon_friend", label: "Friendly", type: "big")
            IconLabelView(icon: "flaticon_book", label: "Speaks slearly", type: "big")
            IconLabelView(icon: "flaticon_ear", label: "Good listener", type: "big")
        }
        .padding()
    }


}

//#Preview {
//    TeacherVideoAndDetails()
//}
