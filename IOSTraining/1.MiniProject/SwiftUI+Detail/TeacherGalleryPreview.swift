//
//  TeacherGalleryPreview.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherGalleryPreview: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gallery")
                .font(.headline)

            HStack {
                previewImage("user_mavuika")
                previewImage("user_nahida")
                previewImage("user_raiden")
            }

            Text("See More")
                .font(.caption)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
    }

    private func previewImage(_ name: String) -> some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    TeacherGalleryPreview()
}
