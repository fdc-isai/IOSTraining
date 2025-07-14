//
//  GalleryCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/12/25.
//

import UIKit

class GalleryCell: UICollectionViewCell {

    @IBOutlet weak var galleryImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell (_ gallery: Gallery) {
        galleryImageView.image = UIImage(named: gallery.imageName)
    }

}
