//
//  TeacherFeatures.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherFeatures: View {
    var body: some View {
        VStack{
            let featureTags = [
                "Good Listener", "For children", "Speaks Clearly"
            ]
            TagList(title: "Features", tags : featureTags)
        }
        .padding()
    }
}

#Preview {
    TeacherFeatures()
}
