//
//  TeacherFeatures.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherFeatures: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView

    var body: some View {
        VStack{
            let featureTags: [String] = viewModel.teacher?.features ?? []
            TagList(title: "Features", tags : featureTags)
        }
        .padding()
    }
}

#Preview {
    TeacherFeatures()
}
