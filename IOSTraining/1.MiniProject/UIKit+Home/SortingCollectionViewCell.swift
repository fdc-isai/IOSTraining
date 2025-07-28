//
//  SortingCollectionCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/22/25.
//

import UIKit

class SortingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sortView: UIView!
    @IBOutlet weak var sortTitleView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sortView.layer.cornerRadius = 80
    }

    func configureCell (_ title: String) {
        sortTitleView.text = title
    }

}
