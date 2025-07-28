//
//  TeacherTabs.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/21/25.
//

import SwiftUI

struct TeacherTabs: View {
    @Binding var selectedTab: String
    let tabs = ["Tutor's Profile", "Lesson Detail", "Reviews"]
    
    var body: some View {
        HStack (spacing: 10) {
            ForEach(tabs, id: \.self) { tab in
                Button(action: {
                    selectedTab = tab
                }) {
                    VStack {
                        Text(tab)
                            .font(.caption)
                            .foregroundColor(selectedTab == tab ? .white : .gray)

                        Rectangle()
                            .fill(selectedTab == tab ? Color.orange : Color.clear)
                            .frame(height: 2)
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
}
