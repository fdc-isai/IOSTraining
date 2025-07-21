//
//  HomeViewController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/18/25.
//

import UIKit
import Combine
import SwiftUI

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func tempButtonForRedirection(_ sender: Any) {
        let vc = UIHostingController(
            rootView: TeacherDetailSwiftUI()
        )
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
