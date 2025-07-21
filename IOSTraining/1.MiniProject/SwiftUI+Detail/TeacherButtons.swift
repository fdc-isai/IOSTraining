//
//  TeacherButtons.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import SwiftUI

struct TeacherButtons: View {
    var body: some View {
        VStack (spacing: 10) {
            Button(action: {

            }) {
                HStack {
                    Image(systemName: "timer")
                    Text("Proceed to sudden lesson")
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(Color.blue)
                .cornerRadius(8)
            }

            Button(action: {

            }) {
                HStack {
                    Image(systemName: "calendar")
                    Text("Booked Lesson")
                }
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 40)
                .background(Color.white)
                .cornerRadius(8)
            }

            HStack {
                IconLabelView(icon: "flaticon_heart", label: "Favorite", type: "vertical")
                IconLabelView(icon: "flaticon_clock", label: "Refresh", type: "vertical")
                IconLabelView(icon: "flaticon_book", label: "Share", type: "vertical")
                IconLabelView(icon: "flaticon_lesson", label: "Keep Note", type: "vertical")
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    TeacherButtons()
}
