//
//  MainTabBarController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/9/25.
//

import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let firstVC = TeacherListViewController()
        let secondVC = UIHostingController(rootView: VocabularySwiftUI())
        let thirdVC = ProductListViewController()
        let fourthVC = SettingsViewController()

        let nav1 = UINavigationController(rootViewController: firstVC)
        let nav2 = UINavigationController(rootViewController: secondVC)
        let nav3 = UINavigationController(rootViewController: thirdVC)
        let nav4 = UINavigationController(rootViewController: fourthVC)

        nav1.tabBarItem = UITabBarItem(title: "Teachers", image: UIImage(systemName: "house"), tag: 0)
        nav2.tabBarItem = UITabBarItem(title: "Memo", image: UIImage(systemName: "note"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Products", image: UIImage(systemName: "star"), tag: 2)
        nav4.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "person"), tag: 3)

        viewControllers = [nav1, nav2, nav3, nav4]
    }
    

}
