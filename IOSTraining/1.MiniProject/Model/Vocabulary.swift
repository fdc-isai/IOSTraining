//
//  Vocabulary.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 8/8/25.
//

import Foundation

struct VocabularyResponse: Codable {
    let total: Int
    let wordbooks: [Vocabulary]?
    let has_next: Bool?

    static func getDefaultData() -> VocabularyResponse {
        return VocabularyResponse(
            total: 0,
            wordbooks: [],
            has_next: false
        )
    }
}

struct Vocabulary: Codable, Hashable {
    let id: Int
    let words: String
    let meaning: String
}
