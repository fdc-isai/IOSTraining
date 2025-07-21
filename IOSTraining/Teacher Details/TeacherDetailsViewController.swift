//
//  TeacherDetailsViewController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/8/25.
//

import UIKit

class TeacherDetailsViewController: UIViewController {

    @IBOutlet weak var recoTutorCollectionView: UICollectionView!
    @IBOutlet weak var moreImageView: UIImageView!

    var teacher: GenshinTeacher?

    let recoTutorCellIdentifier = "RecoTutorCell"

    let recoTutors: [RecoTutor] = [
        RecoTutor(
            tutorName: "Yelan",
            tutorImage: "user_yelan",
            tutorLike: 18,
            tutorFlag: "flag_philippines",
            tutorLessonCount: 7508,
            tutorRating: 4.96,
            tutorAddress: "Philippines"
        ),
        RecoTutor(
            tutorName: "Nahida",
            tutorImage: "user_nahida",
            tutorLike: 56,
            tutorFlag: "flag_japan",
            tutorLessonCount: 8968,
            tutorRating: 5.00,
            tutorAddress: "Philipines"
        ),
        RecoTutor(
            tutorName: "Raiden",
            tutorImage: "user_raiden",
            tutorLike: 11,
            tutorFlag: "flag_japan",
            tutorLessonCount: 4647,
            tutorRating: 3.70,
            tutorAddress: "Japan"
        ),
        RecoTutor(
            tutorName: "Mavuika",
            tutorImage: "user_mavuika",
            tutorLike: 87,
            tutorFlag: "flag_japan",
            tutorLessonCount: 6878,
            tutorRating: 4.22,
            tutorAddress: "Philippines"
        ),
        RecoTutor(
            tutorName: "Zhongli",
            tutorImage: "user_zhongli",
            tutorLike: 65,
            tutorFlag: "flag_japan",
            tutorLessonCount: 123,
            tutorRating: 4.30,
            tutorAddress: "Japan"
        ),
        RecoTutor(
            tutorName: "Venti",
            tutorImage: "user_venti",
            tutorLike: 42,
            tutorFlag: "flag_japan",
            tutorLessonCount: 462,
            tutorRating: 4.98,
            tutorAddress: "Japan"
        ),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = teacher?.name ?? ""

        // setting sections tap events
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapMoreIcon))
        moreImageView.isUserInteractionEnabled = true
        moreImageView.addGestureRecognizer(tapGesture)



        // recommended tutors collection view
        recoTutorCollectionView.delegate = self
        recoTutorCollectionView.dataSource = self
        let nib = UINib(nibName: recoTutorCellIdentifier, bundle: nil)
        recoTutorCollectionView.register(nib, forCellWithReuseIdentifier: recoTutorCellIdentifier)



    }

    @objc func didTapMoreIcon () {
        let alertController = UIAlertController(
            title: nil,
            message: "More Actions",
            preferredStyle: .actionSheet
        )

        let reportAction = UIAlertAction(
            title: "Report",
            style:  .destructive,
            handler: nil
        )

        let cancelAction = UIAlertAction(
            title: "Cancel",
            style:  .cancel,
            handler: nil
        )

        alertController.addAction(reportAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true)

    }



    @IBAction func seeMoreGalerryAction(_ sender: UIButton) {
        let vc = GalleryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}


extension TeacherDetailsViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recoTutors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: recoTutorCellIdentifier,
            for: indexPath
        ) as? RecoTutorCell {
            let recoTutor = recoTutors[indexPath.item]
            cell.configureCell(recoTutor)
            return cell
        }

        return UICollectionViewCell()
    }
}

extension TeacherDetailsViewController:UICollectionViewDelegate{
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print(#function)
    }
}


extension TeacherDetailsViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width: CGFloat = 100 // adjust as needed
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
