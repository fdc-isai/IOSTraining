//
//  NCNetworkManager.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import Foundation
import Alamofire

final class NCNetworkManager {
    static let shared = NCNetworkManager()
    private init() {}

    func getTeacherDetail(
        params: [String: Any],
        completion: @escaping (TeacherDetailsModel) -> Void
    ) {
        dump(params)
        AF.request(
            "https://english-ds1.fdc-inc.com/api/teachers/detail",
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default
        )
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    let tempData = try JSONSerialization.data(withJSONObject: data, options: [.prettyPrinted])
                    if let jsonString = String(data: tempData, encoding: .utf8) {
                        print("🔍 Received JSON:\n\(jsonString)")
                    }
                    let decoder = JSONDecoder()
                    let teacher = try decoder.decode(TeacherDetailsModel.self, from: tempData)
                    dump(teacher)
                    completion(teacher)
                } catch let decodingError as DecodingError {
                    switch decodingError {
                    case .typeMismatch(let type, let context):
                        print("❌ Type mismatch for type \(type): \(context.debugDescription)")
                    case .valueNotFound(let type, let context):
                        print("❌ Value not found for type \(type): \(context.debugDescription)")
                    case .keyNotFound(let key, let context):
                        print("❌ Key not found: \(key.stringValue) – \(context.debugDescription)")
                    case .dataCorrupted(let context):
                        print("❌ Data corrupted: \(context.debugDescription)")
                    @unknown default:
                        print("❌ Unknown decoding error: \(decodingError)")
                    }
                    completion(TeacherDetailsModel.getDummyTeacher())
                } catch {
                    print("❌ General error: \(error.localizedDescription)")
                    completion(TeacherDetailsModel.getDummyTeacher())
                }
            case .failure(let error):
                print("❌ Network request failed: \(error.localizedDescription)")
                completion(TeacherDetailsModel.getDummyTeacher())
            }
        }
    }

    func getTeachersList(
        completion: @escaping (TeacherResponse) -> Void
    ) {

        let params: [String: Any] = [
            "order": 2,
            "users_api_token": "37b2c9241f28e3aa9598f31425e8937b",
            "account_status": 3,
            "conditions": [
                "hide_native_teacher": 0
            ],
            "pagination": 1,
            "api_version": 30,
            "app_version": "4.9.4",
            "device_type": 1
        ]

        AF.request(
            "https://english-staging.fdc-inc.com/api/teachers/search?src_view=home",
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default
        )
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    let tempData = try JSONSerialization.data(withJSONObject: data, options: [.prettyPrinted])
                    if let jsonString = String(data: tempData, encoding: .utf8) {
                        print("🔍 Received JSON:\n\(jsonString)")
                    }
                    let decoder = JSONDecoder()
                    let teachers = try decoder.decode(TeacherResponse.self, from: tempData)
                    dump(teachers)
                    completion(teachers)
                } catch let decodingError as DecodingError {
                    switch decodingError {
                    case .typeMismatch(let type, let context):
                        print("❌ Type mismatch for type \(type): \(context.debugDescription)")
                    case .valueNotFound(let type, let context):
                        print("❌ Value not found for type \(type): \(context.debugDescription)")
                    case .keyNotFound(let key, let context):
                        print("❌ Key not found: \(key.stringValue) – \(context.debugDescription)")
                    case .dataCorrupted(let context):
                        print("❌ Data corrupted: \(context.debugDescription)")
                    @unknown default:
                        print("❌ Unknown decoding error: \(decodingError)")
                    }
                    completion(TeacherResponse.getDummyTeachersList())
                } catch {
                    print("❌ General error: \(error.localizedDescription)")
                    completion(TeacherResponse.getDummyTeachersList())
                }
            case .failure(let error):
                print("❌ Network request failed: \(error.localizedDescription)")
                completion(TeacherResponse.getDummyTeachersList())
            }
        }
    }



    func getAvatarTeachersList(
        completion: @escaping (TeacherResponse) -> Void
    ) {

        let params: [String: Any] = [
            "order": 2,
            "users_api_token": "37b2c9241f28e3aa9598f31425e8937b",
            "account_status": 3,
            "conditions": [
                "avatar_flg" : 1,
                "hide_native_teacher": 0
            ],
            "pagination": 1,
            "api_version": 30,
            "app_version": "4.9.4",
            "device_type": 1
        ]

        AF.request(
            "https://english-staging.fdc-inc.com/api/teachers/search?src_view=home",
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default
        )
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    let tempData = try JSONSerialization.data(withJSONObject: data, options: [.prettyPrinted])
                    if let jsonString = String(data: tempData, encoding: .utf8) {
                        print("🔍 Received JSON:\n\(jsonString)")
                    }
                    let decoder = JSONDecoder()
                    let teachers = try decoder.decode(TeacherResponse.self, from: tempData)
                    dump(teachers)
                    completion(teachers)
                } catch let decodingError as DecodingError {
                    switch decodingError {
                    case .typeMismatch(let type, let context):
                        print("❌ Type mismatch for type \(type): \(context.debugDescription)")
                    case .valueNotFound(let type, let context):
                        print("❌ Value not found for type \(type): \(context.debugDescription)")
                    case .keyNotFound(let key, let context):
                        print("❌ Key not found: \(key.stringValue) – \(context.debugDescription)")
                    case .dataCorrupted(let context):
                        print("❌ Data corrupted: \(context.debugDescription)")
                    @unknown default:
                        print("❌ Unknown decoding error: \(decodingError)")
                    }
                    completion(TeacherResponse.getDummyTeachersList())
                } catch {
                    print("❌ General error: \(error.localizedDescription)")
                    completion(TeacherResponse.getDummyTeachersList())
                }
            case .failure(let error):
                print("❌ Network request failed: \(error.localizedDescription)")
                completion(TeacherResponse.getDummyTeachersList())
            }
        }
    }


    func getTopTeachersList(
        completion: @escaping (TeacherResponse) -> Void
    ) {

        let params: [String: Any] = [
            "order": 2,
            "users_api_token": "37b2c9241f28e3aa9598f31425e8937b",
            "account_status": 3,
            "conditions": [
                "hide_native_teacher": 0
            ],
            "pagination": 1,
            "limit": 10,
            "api_version": 30,
            "app_version": "4.9.4",
            "device_type": 1
        ]

        AF.request(
            "https://english-staging.fdc-inc.com/api/teachers/search?src_view=home",
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default
        )
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    let tempData = try JSONSerialization.data(withJSONObject: data, options: [.prettyPrinted])
                    if let jsonString = String(data: tempData, encoding: .utf8) {
                        print("🔍 Received JSON:\n\(jsonString)")
                    }
                    let decoder = JSONDecoder()
                    let teachers = try decoder.decode(TeacherResponse.self, from: tempData)
                    dump(teachers)
                    completion(teachers)
                } catch let decodingError as DecodingError {
                    switch decodingError {
                    case .typeMismatch(let type, let context):
                        print("❌ Type mismatch for type \(type): \(context.debugDescription)")
                    case .valueNotFound(let type, let context):
                        print("❌ Value not found for type \(type): \(context.debugDescription)")
                    case .keyNotFound(let key, let context):
                        print("❌ Key not found: \(key.stringValue) – \(context.debugDescription)")
                    case .dataCorrupted(let context):
                        print("❌ Data corrupted: \(context.debugDescription)")
                    @unknown default:
                        print("❌ Unknown decoding error: \(decodingError)")
                    }
                    completion(TeacherResponse.getDummyTeachersList())
                } catch {
                    print("❌ General error: \(error.localizedDescription)")
                    completion(TeacherResponse.getDummyTeachersList())
                }
            case .failure(let error):
                print("❌ Network request failed: \(error.localizedDescription)")
                completion(TeacherResponse.getDummyTeachersList())
            }
        }
    }



    func saveNewMemo(
        word: String,
        meaning: String,
        completion: @escaping (Bool) -> Void
    ) {
        let params: [String: Any] = [
            "users_api_token": "dummiesttoken02",
            "words": word,
            "meaning": meaning,
            "api_version": 30,
            "app_version": "5.2.3",
            "device_type": 2
        ]
        AF.request(
            "https://english-staging.fdc-inc.com/api/wordbooks/create",
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default
        )
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                print("✅ Saved successfully:", value)
                completion(true)
            case .failure(let error):
                print("❌ Error saving:", error.localizedDescription)
                completion(false)
            }

        }

    }

    func getVocabularyWords(
        params: [String: Any],
        completion: @escaping (VocabularyResponse) -> Void
    ) {
        AF.request(
            "https://english-staging.fdc-inc.com/api/wordbooks/list",
            method: .post,
            parameters: params,
            encoding: JSONEncoding.default
        )
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    let tempData = try JSONSerialization.data(withJSONObject: data, options: [.prettyPrinted])
                    if let jsonString = String(data: tempData, encoding: .utf8) {
                        print("🔍 Received JSON:\n\(jsonString)")
                    }
                    let decoder = JSONDecoder()
                    let words = try decoder.decode(VocabularyResponse.self, from: tempData)
                    dump(words)
                    completion(words)
                } catch {
                    print("❌ General error: \(error.localizedDescription)")
                    completion(VocabularyResponse.getDefaultData())
                }
            case .failure(let error):
                print("❌ Network request failed: \(error.localizedDescription)")
                completion(VocabularyResponse.getDefaultData())
            }
        }
    }


   
}
