//
//  MainTabBarController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/9/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let firstVC = TeacherListViewController()
        let secondVC = ProductListViewController()
        let thirdVC = SettingsViewController()

        let nav1 = UINavigationController(rootViewController: firstVC)
        let nav2 = UINavigationController(rootViewController: secondVC)
        let nav3 = UINavigationController(rootViewController: thirdVC)

        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        nav2.tabBarItem = UITabBarItem(title: "Products", image: UIImage(systemName: "star"), tag: 1)
        nav3.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "person"), tag: 2)

        viewControllers = [nav1, nav2, nav3]
    }
    

}
