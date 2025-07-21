//
//  TeacherDetailModelView.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/20/25.
//

import Foundation

class TeacherDetailModelView: ObservableObject {
    @Published var teacher: Teacher?

    func fetchTeacherDetail (_ id: Int) {
        let params: [String: Any] = [
            "users_api_token": "token",
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

}
