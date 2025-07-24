//
//  TeacherListCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/8/25.
//

import UIKit

class TeacherListCell: UITableViewCell {
    @IBOutlet weak var teaherAddressLabel: UILabel!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var teacherStatusView: UIView!
    @IBOutlet weak var teacherRateLabel: UILabel!
    @IBOutlet weak var teacherAgeLabel: UILabel!
    @IBOutlet weak var teacherCoinLabel: UILabel!
    @IBOutlet weak var teacherLessonCountLabel: UILabel!
    @IBOutlet weak var teacherImageView: UIImageView!
    @IBOutlet weak var teacherHeartView: UILabel!
    @IBOutlet weak var teacherFlagImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(_ teacher: TeacherThumbnail){
        teacherNameLabel.text = teacher.name_eng
        teaherAddressLabel.text = teacher.country_name
        teacherAgeLabel.text = String(teacher.age ?? 0)
        teacherCoinLabel.text = String(teacher.teacher_reserve_coin ?? 0)
        teacherLessonCountLabel.text = String(teacher.lessons ?? 0)
        teacherRateLabel.text = String(teacher.rating ?? 0.0)
        teacherFlagImageView.image = getFlagImage(for: teacher.country_name)
        teacherFlagImageView.contentMode = .scaleAspectFit
        teacherFlagImageView.clipsToBounds = true
        teacherStatusView.backgroundColor = getLampColor(for: teacher.status ?? 0)
        teacherStatusView.layer.cornerRadius = 5
        teacherStatusView.clipsToBounds = true
        teacherHeartView.text = "\(teacher.favorite_count ?? 0)"

        guard let url = URL(
            string: teacher.image_main ?? "https://placehold.co/400"
        )
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
    }

    func getLampColor(for status: Int) -> UIColor {
        switch status {
        case 1:
            return .systemBlue
        case 6:
            return .systemPink
        default:
            return .lightGray
        }
    }

    func getFlagImage(for country: String) -> UIImage? {
        let normalized = country.lowercased().replacingOccurrences(of: " ", with: "")
        let imageName = "flag_\(normalized)"
        return UIImage(named: imageName) ?? UIImage(named: "flag_unknown")
    }
}
