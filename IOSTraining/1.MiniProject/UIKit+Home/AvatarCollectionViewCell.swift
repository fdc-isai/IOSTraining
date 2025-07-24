//
//  AvatarCollectionViewCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/24/25.
//

import UIKit
import Kingfisher

class AvatarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: CustomUIImageView!
    @IBOutlet weak var teacherNameLabelView: UILabel!
    @IBOutlet weak var teacherCountryView: UILabel!
    @IBOutlet weak var teacherLessonView: UILabel!
    @IBOutlet weak var teacherFavoriteView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ teacher: TeacherThumbnail) {


        guard let url = URL(string: teacher.image_main!)
        else {
            return
        }

        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(
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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 1
        imageView.layer.backgroundColor = UIColor.systemGray2.cgColor
        imageView.layer.borderColor = UIColor.systemGray.cgColor


        teacherNameLabelView.text = teacher.name_eng
        teacherCountryView.text = teacher.country_name
        teacherLessonView.text = "\(teacher.lessons ?? 0)"
        teacherFavoriteView.text = "\(teacher.favorite_count ?? 0)"

    }

}
