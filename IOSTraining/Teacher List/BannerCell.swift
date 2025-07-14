//
//  BannerCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/9/25.
//

import UIKit

class BannerCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!

    private var banners: [Banner] = [
        Banner(imageName: "banner_yelan"),
        Banner(imageName: "banner_nahida"),
        Banner(imageName: "banner_raiden"),
        Banner(imageName: "banner_mauika"),
    ]
    private let bannerCellIdentifier = "BannerCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(nibName: bannerCellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: bannerCellIdentifier)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BannerCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: bannerCellIdentifier,
            for: indexPath
        ) as? BannerCollectionViewCell {
            let banner = banners[indexPath.item]
            cell.configureCell(banner)
            return cell
        }

        return UICollectionViewCell()
    }
}

extension BannerCell:UICollectionViewDelegate{
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print(#function)
    }
}

extension BannerCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let count: Int = 3
//        let spacing: CGFloat = 10.0 * CGFloat(count)
//        let width: CGFloat = (UIScreen.main.bounds.width - spacing) / CGFloat(count)
        return CGSize(width: self.frame.width, height: 180)
    }

}
