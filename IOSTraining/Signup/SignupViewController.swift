//
//  SignupViewController.swift
//  MyPlayground
//
//  Created by Isai Gesapine on 7/8/25.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Signup"
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .white
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
        
        let barButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .plain,
            target: self,
            action: #selector(onTapSettingsButton)
        )
        
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func onTapSettingsButton() {
        print("onTapSettingsButton!")
    }


    @IBAction func onTapDismissButton(_ sender: Any) {
//        self.dismiss(animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    
}
