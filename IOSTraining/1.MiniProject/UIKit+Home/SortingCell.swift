//
//  SortingCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/22/25.
//

import UIKit

class SortingCell: UITableViewCell {
    @IBOutlet weak var sortingCollectionView: UICollectionView!
    private var sortingCellIdentifier = "SortingCollectionViewCell"

    private var sortTitle: [String] = [
        "Ratings Order",
        "Kids Ratings Order",
        "Lesson count order",
        "Favorite count order",
        "Tutor History order",
        "Native Order"
    ]

    override func awakeFromNib() {
        super.awakeFromNib()
        sortingCollectionView.delegate = self
        sortingCollectionView.dataSource = self

        let nib = UINib(nibName: sortingCellIdentifier, bundle: nil)
        sortingCollectionView.register(nib, forCellWithReuseIdentifier: sortingCellIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension SortingCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sortTitle.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: sortingCellIdentifier,
            for: indexPath
        ) as? SortingCollectionViewCell {
            let sortTitle = sortTitle[indexPath.item]
            cell.configureCell(sortTitle)
            return cell
        }

        return UICollectionViewCell()
    }
}

extension SortingCell:UICollectionViewDelegate{
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print(#function)
    }
}

//extension SortingCell:UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let count: Int = 2
//        let spacing: CGFloat = 10.0 * CGFloat(count)
//        let width: CGFloat = (UIScreen.main.bounds.width - spacing) / CGFloat(count)
//        //        return CGSize(width: self.frame.width, height: 180)
//        return CGSize(width: width, height: 100)
//    }
//
//}
