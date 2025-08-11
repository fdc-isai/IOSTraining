//
//  VocabularySearch.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 8/8/25.
//

import SwiftUI

struct VocabularySearch: View {
    @EnvironmentObject var viewModel: VocabularyModelView
    @State private var wordSearch: String = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.gray)

            TextField("Search vocabulary", text: $wordSearch)
                .foregroundColor(Color.gray)
                .onChange(of: wordSearch) { oldKeyword, keyword in
                    viewModel.fetchWords(search: keyword)
                }

            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}

#Preview {
    VocabularySearch()
}
