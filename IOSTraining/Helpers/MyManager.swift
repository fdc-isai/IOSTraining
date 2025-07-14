//
//  MyManager.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/11/25.
//

import Foundation


final class MyManager {
    static let shared = MyManager()
    private(set) var isLoggedIn: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isLoggedIn")
        }

        set {
            UserDefaults.standard.set(newValue, forKey: "isLoggedIn")
        }

    }

    private init() {
        print("Login status: \(isLoggedIn)")
//        setIsLoggedIn(false)
    }

    func doSomething() {
        print("Hey do something")
    }

    func setIsLoggedIn(_ isLoggedIn: Bool) {
        self.isLoggedIn = isLoggedIn

        print("New Login status: \(self.isLoggedIn)")
    }

}

