//
//  Teacher.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import Foundation

// tesacher search api response with pagination data
struct TeacherResponse: Codable {
    let teachers: [TeacherThumbnail]?
    let has_next: Bool?

    static func getDummyTeachersList() -> TeacherResponse {
        return TeacherResponse(
            teachers: [],
            has_next: false
        )
    }
}

// for teacher thunmbnail (declare needed details only)
struct TeacherThumbnail: Codable, Hashable {
    let id: Int
    let name_eng: String
    let country_name: String
    let age: Int?
    let status: Int?
    let teacher_reserve_coin: Int?
    let lessons: Int?
    let rating: Double?
    let image_main: String?
    let favorite_count: Int?
    let native_speaker_flg: Int?
    let suitable_for_children_flg: Int?
    let callan_discount_flg: Bool?
    let beginner_teacher_flg: Int?
    let free_talk_flg: Int?
    let goods: Int?
}


// for teacher detail page (all)
struct Teacher: Codable {
    let id: Int
    let name_eng: String
    let age: Int
    let instructor_history: String?
    let status: Int?
    let coin: Int?
    let teacher_reserve_coin: Int?
    let rating: Double?
    let kids_rating: Double?
    let lessons: Int?
    let state_button: Int?
    let goods: Int
    let favorite: Bool
    let nationality_name: String?
    let native_speaker_flg: Int?
    let callan_unlimited_flg: Int?
    let callan_discount_flg: Bool?
    let beginner_teacher_flg: String?
    let message: String?
    let message_translation: String?
    let features: [String]?
    let hobbies: [String]?
    let generation: [Double]?
    let ratings: [Int]?
    let kids_ratings: [Int]?
    let images: TeacherImages
    let country_image: String?
    let country_name: String?
    let country_name_eng: String?
    let course_badge: [Int]?
    let favorite_count: Int?
    let reservation_lesson_count: Int?
    let lesson_now_count: Int?
    let self_lesson_now_count: Int?
    let occupation: [String]?
    let video_thumbnail: String?
    let last_login_date: String?
    let reserve_and_cancel: ReserveAndCancel?
    var review: Review?

    func getLastLoginDate() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        inputFormatter.locale = Locale(identifier: "en_US_POSIX") // needed for stable parsing

        guard let date = inputFormatter.date(from: self.last_login_date!) else {
            return "Invalid date"
        }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy-MM-dd (EEE)" // output will use user's locale

        return outputFormatter.string(from: date)

    }
}

struct TeacherImages: Codable {
    let main: String
    let album: [String]?
}

struct ReserveAndCancel: Codable {
    let this_month_reserved: Int
    let this_month_cancellation_rate: Int
    let last_month_reserved: Int
    let last_month_cancellation_rate: Int
}

struct Review: Codable, Hashable {
    let message: String?
    let rating: String?
    let textbook_name_lv1: String?
    let textbook_image_url: String?
    let date: String?
}

struct TeacherDetailsModel: Codable {
    let teacher: Teacher

    static func getDummyTeacher() -> TeacherDetailsModel {
        let dummyTeacherDetails = TeacherDetailsModel(
            teacher: Teacher(
                id: 623,
                name_eng: "FDC THREE",
                age: 30,
                instructor_history: "19Năm",
                status: 1,
                coin: 100,
                teacher_reserve_coin: 100,
                rating: 4.91,
                kids_rating: 4.8,
                lessons: 1441,
                state_button: 6,
                goods: 7,
                favorite: false,
                nationality_name: "Serbia",
                native_speaker_flg: 0,
                callan_unlimited_flg: 1,
                callan_discount_flg: false,
                beginner_teacher_flg: "1",
                message: "This teacher is for test only",
                message_translation: "Giáo viên này chỉ dành cho bài kiểm tra",
                features: [
                    "Giỏi nói chuyện miễn phí",
                    "Giỏi giảng dạy bài học vật chất",
                    "Dành cho người mới bắt đầu",
                    "Trẻ em có sẵn",
                    "Hướng cao cấp",
                    "Phát âm"
                ],
                hobbies: [
                    "Eating",
                    "Dancing",
                    "Fdc",
                    "Fdcteacher623"
                ],
                generation: [0, 3.57, 7.14, 7.14, 46.43, 17.86, 17.86],
                ratings: [0, 0, 0, 1, 10],
                kids_ratings: [0, 0, 0, 1, 4],
                images: TeacherImages(
                    main: "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2015_08_06_10241555c2b73f89d33.jpg",
                    album: [
                        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2022_09_14_1731086321914c57dae.png",
                        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2022_09_14_1731076321914bd258c.png",
                        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2022_09_14_1731076321914ba50d5.png",
                        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2022_09_14_17180463218e3cc9a51.png",
                        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2022_09_14_17180463218e3ca6648.png",
                        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2022_09_14_17180463218e3c679d2.png",
                        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2022_09_14_17100563218c5d74bfc.png",
                        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2022_09_14_17100563218c5d4cf74.png",
                        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2022_09_14_17100563218c5d22d2b.png"
                    ]
                ),
                country_image: "http://english-ds1.fdc-inc.com/user/images/flag/serbia.png",
                country_name: "Serbia",
                country_name_eng: "Serbia",
                course_badge: [
                    45, 213, 208, 51, 193, 194, 195, 188, 191, 178,
                    155, 152, 121, 78, 59, 72, 174, 79, 93, 5,
                    90, 50, 13, 123, 49, 65, 201, 99, 173, 63,
                    105, 203, 84, 106, 82, 107, 88, 160, 196, 110,
                    113, 4, 118, 125, 119, 117, 164, 198
                ],
                favorite_count: 94,
                reservation_lesson_count: 260,
                lesson_now_count: 1181,
                self_lesson_now_count: 0,
                occupation: [],
                video_thumbnail: "https://img.youtube.com/vi/HdwwqZExrVo/0.jpg",
                last_login_date: "2025-07-18 14:05:29",
                reserve_and_cancel: ReserveAndCancel(
                    this_month_reserved: 0,
                    this_month_cancellation_rate: 0,
                    last_month_reserved: 0,
                    last_month_cancellation_rate: 100
                ),
                review:
                    Review(
                        message: "Great lesson!",
                        rating: "5",
                        textbook_name_lv1: "Beginner",
                        textbook_image_url: nil,
                        date: "2025-07-20"
                    )

            )
        )

        return dummyTeacherDetails

    }
}

struct Banner {
    let imageName: String
}

enum Sections {
    case teachers([TeacherThumbnail])
    case banner(Banner)
}
