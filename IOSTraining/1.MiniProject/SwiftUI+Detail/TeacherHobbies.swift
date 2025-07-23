//
//  TeacherHobbies.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/19/25.
//

import SwiftUI

struct TeacherHobbies: View {
    @EnvironmentObject var viewModel: TeacherDetailModelView
    
    var body: some View {
        VStack{
            let hobbiesTags : [String] = viewModel.teacher?.hobbies ?? []
            TagList(title: "Hobbies", tags : hobbiesTags)
        }
        .padding()
    }
}

#Preview {
    TeacherHobbies()
}
