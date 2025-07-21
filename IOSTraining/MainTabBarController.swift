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
        let mainVC = HomeViewController()
        let firstVC = TeacherListViewController()
        let secondVC = ProductListViewController()
        let thirdVC = SettingsViewController()

        let homeNav = UINavigationController(rootViewController: mainVC)
        let nav1 = UINavigationController(rootViewController: firstVC)
        let nav2 = UINavigationController(rootViewController: secondVC)
        let nav3 = UINavigationController(rootViewController: thirdVC)

        homeNav.tabBarItem = UITabBarItem(title: "NC Home", image: UIImage(systemName: "house"), tag: 0)
        nav1.tabBarItem = UITabBarItem(title: "Teachers", image: UIImage(systemName: "list.bullet"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Products", image: UIImage(systemName: "star"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "person"), tag: 3)

        viewControllers = [homeNav, nav1, nav2, nav3]
    }
    

}
