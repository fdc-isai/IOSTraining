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
    @IBOutlet weak var teacherFlagImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.accessoryType = .disclosureIndicator
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(_ teacher: Teacher){
        teacherNameLabel.text = teacher.name
        teaherAddressLabel.text = teacher.address
        teacherAgeLabel.text = String(teacher.age)
        teacherCoinLabel.text = String(teacher.coin)
        teacherLessonCountLabel.text = String(teacher.lessonCount)
        teacherRateLabel.text = String(teacher.rating)

        teacherImageView.image = UIImage(named: teacher.imageName)
        teacherImageView.contentMode = .scaleAspectFill
        teacherImageView.clipsToBounds = true
        teacherImageView.layer.cornerRadius = 10
        teacherImageView.layer.borderWidth = 1
        teacherImageView.layer.backgroundColor = UIColor.systemGray2.cgColor
        teacherImageView.layer.borderColor = UIColor.systemGray.cgColor

        teacherFlagImageView.image = getFlagImage(for: teacher.address)
        teacherFlagImageView.contentMode = .scaleAspectFit
        teacherFlagImageView.clipsToBounds = true


        teacherStatusView.backgroundColor = getLampColor(for: teacher.status)
        teacherStatusView.layer.cornerRadius = 5
        teacherStatusView.clipsToBounds = true

    }

    func getLampColor(for status: Int) -> UIColor {
        switch status {
        case 1:
            return .systemBlue
        case 2:
            return .systemRed
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
