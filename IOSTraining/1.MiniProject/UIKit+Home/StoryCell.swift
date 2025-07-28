//
//  StoryCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/22/25.
//

import UIKit

class StoryCell: UITableViewCell {
    @IBOutlet weak var storyCollectionView: UICollectionView!
    private var cellIdentier = "StoryCollectionViewCell"
    private var stories: [String] = [
        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2024_06_13_172205666aac2d54a39.png",
        "https://nativecamp-public-web-production.s3.ap-northeast-1.amazonaws.com/2025_04_23_15464368088cd371c2e.png",
        "https://nativecamp-public-web-production.s3.ap-northeast-1.amazonaws.com/2025_06_09_1322196846617bab6ee.jpg",
        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2024_06_13_171607666aaac705152.png",
        "https://nativecamp-public-web-production.s3.ap-northeast-1.amazonaws.com/2025_02_09_19080967a87e89cca27.png",
        "https://nativecamp-public-web-production.s3-ap-northeast-1.amazonaws.com/2024_06_13_163733666aa1bd7bc31.png"
    ]

    override func awakeFromNib() {
        super.awakeFromNib()
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self

        let nib = UINib(nibName: cellIdentier, bundle: nil)
        storyCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension StoryCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellIdentier,
            for: indexPath
        ) as? StoryCollectionViewCell {
            let story = stories[indexPath.item]
            cell.configureCell(story)
            return cell
        }

        return UICollectionViewCell()
    }
}

extension StoryCell:UICollectionViewDelegate{
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print(#function)
    }
}

extension StoryCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
