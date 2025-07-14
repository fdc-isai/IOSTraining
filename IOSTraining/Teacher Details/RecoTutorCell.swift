//
//  RecoTutorCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/12/25.
//

import UIKit

class RecoTutorCell: UICollectionViewCell {
    @IBOutlet weak var tutorName: UILabel!
    @IBOutlet weak var tutorImageView: UIImageView!
    @IBOutlet weak var tutorLike: UILabel!
    @IBOutlet weak var tutorFlag: UIImageView!
    @IBOutlet weak var tutorLessonCount: UILabel!
    @IBOutlet weak var tutorRating: UILabel!
    @IBOutlet weak var tutorAddress: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ tutor: RecoTutor) {
        tutorName.text = tutor.tutorName
        tutorImageView.image = UIImage(named: tutor.tutorImage)
        tutorLike.text = "\(tutor.tutorLike)"
        tutorFlag.image = UIImage(named: tutor.tutorFlag)
        tutorLessonCount.text = "\(tutor.tutorLessonCount)"
        tutorRating.text = "\(tutor.tutorRating)"
        tutorAddress.text = tutor.tutorAddress

    }
}
