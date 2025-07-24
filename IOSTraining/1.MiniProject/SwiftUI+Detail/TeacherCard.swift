//
//  TeacherCard.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherCard: View {
    var teacher: TeacherThumbnail

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            OnlineImageView(imageURL: teacher.image_main)
                .scaledToFill()
                .frame(width: 120, height: 120)
                .background(Color.white)
                .clipped()

            VStack(alignment: .leading, spacing: 10) {
                Text(teacher.name_eng)
                    .font(.subheadline)
                    .lineLimit(1)

                HStack(spacing: 10) {
                    Image(getFlagImage(for: teacher.country_name) ?? "flag_unknown")
                        .resizable()
                        .frame(width: 20, height: 12)

                    Text(teacher.country_name)
                        .font(.caption2)
                        .lineLimit(1)
                }

                VStack(alignment: .leading, spacing: 5) {
                    IconLabelView(icon: "flaticon_star", label: "\(teacher.rating ?? 0.00)")
                    IconLabelView(icon: "flaticon_monitor", label: "\(teacher.lessons ?? 0) times")
                    IconLabelView(
                        icon: "flaticon_heart",
                        label: "\(teacher.favorite_count ?? 0) people"
                    )
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
        }
        .frame(width: 120)
        .background(Color(.darkGray))
        .cornerRadius(10)
    }

    func getFlagImage(for country: String) -> String? {
        let normalized = country.lowercased().replacingOccurrences(of: " ", with: "")
        let imageName = "flag_\(normalized)"
        return imageName
    }
}
