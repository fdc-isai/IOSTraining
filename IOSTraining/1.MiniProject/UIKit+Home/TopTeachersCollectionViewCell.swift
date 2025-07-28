//
//  TopTeachersCollectionViewCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/24/25.
//

import UIKit

class TopTeachersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var teacherImageView: CustomUIImageView!
    @IBOutlet weak var teacherFavoriteView: UILabel!
    @IBOutlet weak var teacherLessonView: UILabel!
    @IBOutlet weak var teacherRatingView: UILabel!
    @IBOutlet weak var teacherCountryView: UILabel!
    @IBOutlet weak var teacherNameView: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ teacher: TeacherThumbnail) {
        guard let url = URL(string: teacher.image_main!)
        else {
            return
        }

        teacherImageView.kf.indicatorType = .activity
        teacherImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "user_unknown"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        { result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        teacherImageView.contentMode = .scaleAspectFill
        teacherImageView.clipsToBounds = true
        teacherImageView.layer.cornerRadius = 10
        teacherImageView.layer.borderWidth = 1
        teacherImageView.layer.backgroundColor = UIColor.systemGray2.cgColor
        teacherImageView.layer.borderColor = UIColor.systemGray.cgColor

        teacherNameView.text = teacher.name_eng
        teacherCountryView.text = teacher.country_name
        teacherRatingView.text = "\(teacher.rating ?? 0.00)"
        teacherLessonView.text = "\(teacher.lessons ?? 0)"
        teacherFavoriteView.text = "\(teacher.favorite_count ?? 0)"

    }

}
