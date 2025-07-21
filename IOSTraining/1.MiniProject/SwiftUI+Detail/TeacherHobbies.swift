//
//  TeacherHobbies.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherHobbies: View {
    var body: some View {
        VStack{
            let hobbiesTags = [
                "Writing peoms", "Music", "Watching movies"
            ]
            TagList(title: "Hobbies", tags : hobbiesTags)
        }
        .padding()
    }
}

#Preview {
    TeacherHobbies()
}
