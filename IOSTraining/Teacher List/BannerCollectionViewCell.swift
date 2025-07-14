//
//  BannerCollectionViewCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/9/25.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bannerImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell (_ banner: Banner) {
        bannerImageView.image = UIImage(named: banner.imageName)
    }

}
