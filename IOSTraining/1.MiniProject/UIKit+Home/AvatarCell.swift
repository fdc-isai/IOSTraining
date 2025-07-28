//
//  AvatarCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/24/25.
//

import UIKit

class AvatarCell: UITableViewCell {
    @IBOutlet weak var avatarCollectionView: UICollectionView!
    private var cellIdentifier = "AvatarCollectionViewCell"
    private var avatarTeachers: [TeacherThumbnail] = []

    override func awakeFromNib() {
        super.awakeFromNib()

        NCNetworkManager.shared.getAvatarTeachersList { response in
            self.avatarTeachers = response.teachers ?? []

            DispatchQueue.main.async {
                self.avatarCollectionView.reloadData()
            }
        }


        avatarCollectionView.delegate = self
        avatarCollectionView.dataSource = self

        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        avatarCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension AvatarCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return avatarTeachers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellIdentifier,
            for: indexPath
        ) as? AvatarCollectionViewCell {
            let avatar = avatarTeachers[indexPath.item]
            cell.configureCell(avatar)
            return cell
        }

        return UICollectionViewCell()
    }
}

extension AvatarCell:UICollectionViewDelegate{
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print(#function)
    }
}


extension AvatarCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ avatarCollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 190  //= avatarCollectionView.frame.height
        let width: CGFloat = 90 // adjust as needed
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

