//
//  DummyTLISTViewController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/22/25.
//

import UIKit
import SwiftUI


class DummyTLISTViewController: UIViewController {

    @IBOutlet weak var ratingOrderButton: UIButton!
    @IBOutlet weak var kidsRatingsOrderButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()


        // UI adjustments
        ratingOrderButton.layer.cornerRadius = ratingOrderButton.frame.height / 2
        ratingOrderButton.clipsToBounds = true

        kidsRatingsOrderButton.layer.cornerRadius = kidsRatingsOrderButton.frame.height / 2
        kidsRatingsOrderButton.clipsToBounds = true
    }

    @IBAction func onTagNCxAI(_ sender: Any) {
        let vc = UIHostingController(
            rootView: TeacherDetailSwiftUI()
        )
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func tempButtonForRedirection(_ sender: Any) {
        let vc = UIHostingController(
            rootView: TeacherDetailSwiftUI()
        )
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
