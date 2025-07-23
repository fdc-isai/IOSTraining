//
//  RecoTutor.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/12/25.
//

import Foundation


struct RecoTutor: Codable {
    let tutorName: String
    let tutorImage: String
    let tutorLike: Int
    let tutorFlag: String
    let tutorLessonCount: Int
    let tutorRating: Double
    let tutorAddress: String
}


struct GenshinTeacher {
    let status: Int
    let name: String
    let address: String
    let age: Int
    let rating: Double
    let lessonCount: Int
    let coin: Int
    let imageName: String
}
