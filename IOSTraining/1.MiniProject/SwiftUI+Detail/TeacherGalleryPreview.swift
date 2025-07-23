//
//  TeacherGalleryPreview.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherGalleryPreview: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView

    var body: some View {
        VStack(alignment: .leading) {
            Text("Gallery")
                .font(.headline)

            HStack {
                ForEach((viewModel.teacher?.images.album ?? []).prefix(3), id: \.self) { image in
                    OnlineImageView(imageURL: image)
                        .frame(maxWidth: .infinity)
                }

            }

            Text("See More")
                .font(.caption)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
    }
}

#Preview {
    TeacherGalleryPreview()
}
