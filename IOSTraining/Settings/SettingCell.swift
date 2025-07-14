//
//  SettingCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/9/25.
//

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet weak var settingNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.accessoryType = .disclosureIndicator

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(_ setting: Setting) {
        print(setting.name)
        settingNameLabel.text = setting.name
    }

}


