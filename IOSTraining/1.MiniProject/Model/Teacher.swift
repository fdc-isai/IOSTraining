//
//  Teacher.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import Foundation

struct TeacherDetailsModel: Codable {
    let teacher: Teacher?
    let current_jp_time: String
    let lamp_color_delay: Int
    let student_virtual_background: StudentVirtualBackground?
    let ai_lesson_photo: String
    let ai_ending_prompt_time: Int
    let ai_silence_duration: Int

    static func getDummyTeacher() -> TeacherDetailsModel {
        let dummyTeacherDetails = TeacherDetailsModel(
            teacher: Teacher(
                id: 623,
                name: "",
                name_ja: "ãƒ„ãƒãƒ¤",
                name_eng: "FDC THREE",
                age: 30,
                instructor_history: "19Năm",
                status: 1,
                coin: 100,
                rating: 4.91,
                kids_rating: 4.8,
                lessons: 1441,
                reserve_count: 1,
                selfLessonCount: 0,
                selfDaysPast: 0,
                state_button: 6,
                goods: 7,
                favorite: false,
                favorite_color: nil,
                hidden_flg: 0,
                nationality_id: 0,
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
                staff_message: "Self Introduction (in third person perspective)Self Introduction (in third person perspective)Self Introduction (in third person perspective)Self Introduction (in third person perspective)Self Introduction (in third person perspective)",
                staff_message_translation: "Tự giới thiệu (ở góc nhìn người thứ ba)Tự giới thiệu (ở góc nhìn của người thứ ba)Tự giới thiệu (ở góc nhìn của người thứ ba)Tự giới thiệu (ở góc nhìn của người thứ ba)Giới thiệu về bản thân (ở góc nhìn của người thứ ba)",
                title_threshold_type: 0,
                evaluation: Evaluation(
                    count: 11,
                    value: 4.91,
                    comment_count: 1,
                    self_comment_count: 0
                ),
                choosen_for_age: [0, 3.57, 7.14, 7.14, 46.43, 17.86, 17.86],
                generation: [0, 3.57, 7.14, 7.14, 46.43, 17.86, 17.86],
                ratings: [0, 0, 0, 1, 10],
                kids_ratings: [0, 0, 0, 1, 4],
                images: TeacherImages(
                    main: "https://nativecamp-public-web-staging.s3-ap-northeast-1.amazonaws.com/2024_02_15_16392865cdbfb053f6f.png",
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
                youtube_tag: "HdwwqZExrVo",
                country_image: "http://english-ds1.fdc-inc.com/user/images/flag/serbia.png",
                country_name: "Serbia",
                country_name_eng: "Serbia",
                kids_ui_country_image: "http://english-ds1.fdc-inc.com/user/webroot/images/kids_ui/character_flags/serbia.png",
                residential_country: ResidentialCountry(
                    residential_country_id: 98,
                    residential_country_name: "Japan",
                    residential_country_eng: "Japan",
                    residential_country_image: "http://english-ds1.fdc-inc.com/user/images/flag/japan.png",
                    residential_country_display_flg: 0
                ),
                residential_region: ResidentialRegion(
                    residential_region_name_eng: "",
                    residential_region_name: "",
                    residential_region_delete_flg: 1
                ),
                counseling_flg: "0",
                last_lesson_loading: 0,
                open_reservations: nil,
                joinable_short_lesson: nil,
                course_badge: [
                    45, 213, 208, 51, 193, 194, 195, 188, 191, 178,
                    155, 152, 121, 78, 59, 72, 174, 79, 93, 5,
                    90, 50, 13, 123, 49, 65, 201, 99, 173, 63,
                    105, 203, 84, 106, 82, 107, 88, 160, 196, 110,
                    113, 4, 118, 125, 119, 117, 164, 198
                ],
                residence_id: 166,
                residence_name: "Nhật Bản",
                residence_image: "http://english-ds1.fdc-inc.com/user/images/flag/japan.png",
                favorite_count: 94,
                reservation_lesson_count: 260,
                lesson_now_count: 1181,
                self_reservation_lesson_count: 0,
                self_lesson_now_count: 0,
                self_lesson_count: 0,
                review: Review(rating: ""),
                coin_lesson_now: 0,
                coin_reservation: "100.00",
                coin_callan: "100.00",
                coin_reservation_before_discount: 100,
                coin_reservation_after_discount: 0,
                show_native_option_amount_flg: false,
                coin_callan_before_discount: 100,
                sapuri_lesson_count: 42,
                timezone_id: 291,
                teacher_withdrawn_flg: 0,
                live_teacher_flg: 1,
                live_lesson_flg: 0,
                chocotto_camp_flg: 1,
                user_ongoing_live: 0,
                ongoing_live_chat_hash: nil,
                teacher_lamp_delay: 0,
                sapuri_coin: nil,
                home_flg: 0,
                has_callan_badge: 1,
                supports_callan_flg: 1,
                lesson_time_remaining: 0,
                memo: Memo(id: nil, memo: nil),
                occupation: [],
                feature_tags: FeatureTags(
                    callan_halfprice_flg: 0,
                    native_speaker_flg: 0,
                    beginner_teacher_flg: 1
                ),
                rank_coin_id: "10",
                video_thumbnail: "https://img.youtube.com/vi/HdwwqZExrVo/0.jpg",
                birthday_show_flg: 0,
                allow_show_details: 1,
                last_login_date: "2025-07-18 14:05:29",
                reserved_lesson_type: nil,
                reserve_and_cancel: ReserveAndCancel(
                    this_month_reserved: 0,
                    this_month_cancellation_rate: 0,
                    last_month_reserved: 0,
                    last_month_cancellation_rate: 100
                ),
                show_cancellation_alert_flg: false
            ),
            current_jp_time: "2025-07-20 00:56:56",
            lamp_color_delay: 0,
            student_virtual_background: StudentVirtualBackground(
                vbg_id: nil,
                vbgImage: ""
            ),
            ai_lesson_photo: "https://nativecamp-public-web-staging.s3-ap-northeast-1.amazonaws.com/2025_03_26_17001367e3b40d3e226.jpg",
            ai_ending_prompt_time: 290,
            ai_silence_duration: 3
        )

        return dummyTeacherDetails

    }
}

struct Teacher: Codable {
    let id: Int
    let name: String
    let name_ja: String
    let name_eng: String
    let age: Int
    let instructor_history: String
    let status: Int
    let coin: Int
    let rating: Double
    let kids_rating: Double
    let lessons: Int
    let reserve_count: Int
    let selfLessonCount: Int
    let selfDaysPast: Int
    let state_button: Int
    let goods: Int
    let favorite: Bool
    let favorite_color: String?
    let hidden_flg: Int
    let nationality_id: Int
    let nationality_name: String
    let native_speaker_flg: Int
    let callan_unlimited_flg: Int
    let callan_discount_flg: Bool
    let beginner_teacher_flg: String
    let message: String
    let message_translation: String
    let features: [String]
    let hobbies: [String]
    let staff_message: String
    let staff_message_translation: String
    let title_threshold_type: Int
    let evaluation: Evaluation
    let choosen_for_age: [Double]
    let generation: [Double]
    let ratings: [Int]
    let kids_ratings: [Int]
    let images: TeacherImages
    let youtube_tag: String?
    let country_image: String
    let country_name: String
    let country_name_eng: String
    let kids_ui_country_image: String
    let residential_country: ResidentialCountry
    let residential_region: ResidentialRegion
    let counseling_flg: String
    let last_lesson_loading: Int
    let open_reservations: String?
    let joinable_short_lesson: String?
    let course_badge: [Int]
    let residence_id: Int
    let residence_name: String
    let residence_image: String
    let favorite_count: Int
    let reservation_lesson_count: Int
    let lesson_now_count: Int
    let self_reservation_lesson_count: Int
    let self_lesson_now_count: Int
    let self_lesson_count: Int
    let review: Review?
    let coin_lesson_now: Int
    let coin_reservation: String
    let coin_callan: String
    let coin_reservation_before_discount: Int
    let coin_reservation_after_discount: Int
    let show_native_option_amount_flg: Bool
    let coin_callan_before_discount: Int
    let sapuri_lesson_count: Int
    let timezone_id: Int
    let teacher_withdrawn_flg: Int
    let live_teacher_flg: Int
    let live_lesson_flg: Int
    let chocotto_camp_flg: Int
    let user_ongoing_live: Int
    let ongoing_live_chat_hash: String?
    let teacher_lamp_delay: Int
    let sapuri_coin: Int?
    let home_flg: Int
    let has_callan_badge: Int
    let supports_callan_flg: Int
    let lesson_time_remaining: Int
    let memo: Memo?
    let occupation: [String]?
    let feature_tags: FeatureTags?
    let rank_coin_id: String?
    let video_thumbnail: String?
    let birthday_show_flg: Int
    let allow_show_details: Int
    let last_login_date: String
    let reserved_lesson_type: String?
    let reserve_and_cancel: ReserveAndCancel
    let show_cancellation_alert_flg: Bool
}


struct Evaluation: Codable {
    let count: Int
    let value: Double
    let comment_count: Int
    let self_comment_count: Int
}

struct TeacherImages: Codable {
    let main: String
    let album: [String]
}

struct ResidentialCountry: Codable {
    let residential_country_id: Int
    let residential_country_name: String
    let residential_country_eng: String
    let residential_country_image: String
    let residential_country_display_flg: Int
}

struct ResidentialRegion: Codable {
    let residential_region_name_eng: String
    let residential_region_name: String
    let residential_region_delete_flg: Int
}

struct FeatureTags: Codable {
    let callan_halfprice_flg: Int?
    let native_speaker_flg: Int?
    let beginner_teacher_flg: Int?
}

struct ReserveAndCancel: Codable {
    let this_month_reserved: Int
    let this_month_cancellation_rate: Int
    let last_month_reserved: Int
    let last_month_cancellation_rate: Int
}


struct Memo: Codable {
    let id: Int?
    let memo: String?
}

struct Review: Codable {
    let rating: String?
}

struct StudentVirtualBackground: Codable {
    let vbg_id: Int?
    let vbgImage: String?
}
