//
//  MemoSwiftUI.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 8/7/25.
//

import SwiftUI

struct VocabularySwiftUI: View {
    @StateObject var viewModel: VocabularyModelView = .init()

    @State private var newWord: String = ""
    @State private var newMeaning: String = ""
    @State private var showAddWord: Bool = false
    @State private var showSuccess: Bool = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            ScrollView (.vertical) {

                VStack{

                    Text("Vocabulary Book")
                        .font(.title3)
                        .fontWeight(.bold)

                    VocabularySearch()

                    VocabularyList()

                }
                .padding()
            }

            VStack {
                Spacer()

                HStack {
                    Spacer()

                    Button {
                        showAddWord = !showAddWord
                    } label: {
                        Image("flaticon_add")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }


                }
                .padding()
                .frame(maxWidth: .infinity)
            }


            if showAddWord {
                ZStack {
                    Color.black.opacity(0.7)

                    VStack (spacing: 10) {
                        Spacer()
                        Text("Create new").fontWeight(.bold)
                        Spacer()
                        TextField("Enter english words", text: $newWord)
                            .padding(10)
                            .foregroundColor(Color.gray)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                        Spacer()
                        TextField("Enter meaning", text: $newMeaning)
                            .padding(10)
                            .foregroundColor(Color.gray)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                        Spacer()
                        Divider()
                            .background(Color.gray)

                        HStack {
                            Spacer()
                            Button {
                                showAddWord = !showAddWord
                            } label: {
                                Text("Cancel")
                            }

                            Spacer()
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 1, height: 30)

                            Spacer()
                            Button {
                                NCNetworkManager.shared.saveNewMemo(
                                    word: newWord,
                                    meaning: newMeaning
                                ) { success in
                                    showAddWord = success ? false : true
                                    showSuccess = success

                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        showSuccess = false
                                        viewModel.fetchWords(search: "")
                                    }
                                }
                            } label: {
                                Text("Save")
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width: 300, height: 300)
                    .background(Color(red: 0.12, green: 0.12, blue: 0.12))
                    .cornerRadius(12)
                }

            }


            if showSuccess {
                ZStack {
                    Color.black.opacity(0.7)

                    VStack (spacing: 10) {
                        Spacer()

                        Image("flaticon_check")
                            .resizable()
                            .frame(width: 50, height: 50)

                        Text("New Word Saved!")

                        Spacer()

                    }
                    .padding()
                    .frame(width: 200, height: 200)
                    .background(Color(red: 0.12, green: 0.12, blue: 0.12))
                    .cornerRadius(12)
                }

            }

        }
        .foregroundColor(.white)
        .onAppear {
            viewModel.fetchWords(search: "")
        }
        .environmentObject(viewModel)
    }

}

#Preview {
    VocabularySwiftUI()
}
