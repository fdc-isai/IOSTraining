//
//  VocabularyModelView.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 8/8/25.
//

import Foundation

class VocabularyModelView: ObservableObject {
    @Published var words: VocabularyResponse?

    func fetchWords (search: String?) {

        var params: [String: Any] = [
            "users_api_token": "dummiesttoken02",
            "pagination": 1,
            "api_version": 30,
            "app_version": "5.2.3",
            "device_type": 2
        ]

        if let search, !search.isEmpty {
            params["text"] = search
        }

        NCNetworkManager.shared.getVocabularyWords(params: params) { response in
            DispatchQueue.main.async {
                self.words = response
            }
        }
    }
}
