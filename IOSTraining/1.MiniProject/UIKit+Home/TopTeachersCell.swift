//
//  TopTeachersCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/24/25.
//

import UIKit

class TopTeachersCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    private var cellIdentifier = "TopTeachersCollectionViewCell"
    private var topteachers: [TeacherThumbnail] = []

    override func awakeFromNib() {
        super.awakeFromNib()

        NCNetworkManager.shared.getTopTeachersList { response in
            self.topteachers = response.teachers ?? []

            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }

        collectionView.delegate = self
        collectionView.dataSource = self

        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension TopTeachersCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topteachers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellIdentifier,
            for: indexPath
        ) as? TopTeachersCollectionViewCell {
            let teacher = topteachers[indexPath.item]
            cell.configureCell(teacher)
            return cell
        }

        return UICollectionViewCell()
    }
}

extension TopTeachersCell:UICollectionViewDelegate{
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print(#function)
    }
}


extension TopTeachersCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ avatarCollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 200  //= avatarCollectionView.frame.height
        let width: CGFloat = 90 // adjust as needed
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

