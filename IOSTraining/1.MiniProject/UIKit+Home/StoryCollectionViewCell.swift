//
//  StoryCollectionViewCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/22/25.
//

import UIKit
import Kingfisher

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var storyImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    func configureCell (_ imageUrl: String) {
        guard let url = URL(string: imageUrl)
        else {
            return
        }

        storyImageView.kf.indicatorType = .activity
        storyImageView.kf.setImage(
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

        storyImageView.layer.cornerRadius = 40
        storyImageView.clipsToBounds = true
        storyImageView.layer.borderColor = UIColor.systemPink.cgColor
        storyImageView.layer.borderWidth = 2

    }
}
