//
//  NCCustomUI.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TagList: View {
    var title: String = ""
    var tags: [String] = []

    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)

            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(tags, id: \.self) { feature in
                        TagView(text: feature)
                    }
                }
            }
        }
    }
}

struct TagView: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(Color(white: 0.4))
            .frame(width: .infinity)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }

}

#Preview {
    TeacherFeatures()
}
