//
//  TeacherDetailModelView.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/20/25.
//

import Foundation

class TeacherDetailModelView: ObservableObject {
    @Published var teacher: Teacher?
    @Published var reviews: [Review]?

    func fetchTeacherDetail (_ id: Int) {
        let params: [String: Any] = [
            "users_api_token": "9ede4afb0c7c083a18318f0c5585b606",
            "teachers_id": id,
            "user_language": "en",
            "emergency_lesson": 0,
            "device_type": 1,
            "app_version": "4.8.5"
        ]

        NCNetworkManager.shared.getTeacherDetail(params: params) { response in
            DispatchQueue.main.async {
                self.teacher = response.teacher
            }
        }
    }

    func getRandomTBImage () -> String {
        let randomNumber = Int.random(in: 1...12)
        return "tb_\(randomNumber)"
    }

}
