//
//  OTPViewController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/13/25.
//

import UIKit

class OTPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func ontapVeriifyOTPButton(_ sender: Any) {
        // assume successful validation on login
        MyManager.shared.setIsLoggedIn(true)

//        let vc = MainTabBarController(nibName: "MainTabBarController", bundle: nil)
//        self.navigationController?.pushViewController(vc, animated: false)

        
        let mainVC = MainTabBarController()

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {

            window.rootViewController = mainVC
            window.makeKeyAndVisible()

            // Optional transition
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
        }
    }

}
