//
//  NCAISwiftUI.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 8/7/25.
//

import SwiftUI

struct NCAISwiftUI: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {

                    }) {
                        HStack {
                            Text("Lessons")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .background(Color.blue)
                        .cornerRadius(8)
                    }
                }
            }
        }
    }
}

#Preview {
    NCAISwiftUI()
}
