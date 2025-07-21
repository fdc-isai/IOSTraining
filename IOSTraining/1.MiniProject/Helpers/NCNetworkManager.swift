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
        AF.request(
            "https://english-ds1.fdc-inc.com/api/teachers/detail",
            method: .post,
            parameters: params
        )
        .responseJSON { response in
            switch response.result {
            case .success(let data):
                do {
                    let tempData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let decoder = JSONDecoder()
                    let teacher = try decoder.decode(TeacherDetailsModel.self, from: tempData)
                    dump(teacher)
                    completion(teacher)
                } catch {
                    completion(TeacherDetailsModel.getDummyTeacher())
                    print("Unable to serialize json object")
                }
            case .failure(let error):
                completion(TeacherDetailsModel.getDummyTeacher())
                print("Error: \(error)")
            }
        }
    }
}
