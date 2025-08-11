//
//  VocabularyList.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 8/8/25.
//

import SwiftUI

struct VocabularyList: View {
    @EnvironmentObject var viewModel: VocabularyModelView
    
    var body: some View {
        VStack {
            if let wordbooks = viewModel.words?.wordbooks, !wordbooks.isEmpty {
                ForEach(wordbooks, id: \.id) { word in
                    HStack (alignment: .top) {
                        VStack (alignment: .leading){
                            Text(word.words).fontWeight(.bold)
                            Text(word.meaning).font(.caption)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .frame(maxHeight: .infinity, alignment: .center)

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    Divider()
                        .background(Color.gray)
                }

            }

        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    VocabularyList()
}
