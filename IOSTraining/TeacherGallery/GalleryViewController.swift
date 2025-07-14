//
//  GalleryViewController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/12/25.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var galleryCollectionView: UICollectionView!
    let galleryCellIdentifier = "GalleryCell"

    let galleries: [Gallery] = [
        Gallery(name: "Yelan", imageName: "image_rand_1"),
        Gallery(name: "Mavuika", imageName: "image_rand_2"),
        Gallery(name: "Nahida", imageName: "image_rand_3"),
        Gallery(name: "Raiden", imageName: "image_rand_4"),
        Gallery(name: "Mavuika", imageName: "image_rand_5"),
        Gallery(name: "Nahida", imageName: "image_rand_6"),
        Gallery(name: "Raiden", imageName: "image_rand_7"),

    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self

        let nib = UINib(nibName: galleryCellIdentifier, bundle: nil)
        galleryCollectionView.register(nib, forCellWithReuseIdentifier: galleryCellIdentifier)

    }


}


extension GalleryViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleries.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: galleryCellIdentifier,
            for: indexPath
        ) as? GalleryCell {
            let gallery = galleries[indexPath.item]
            cell.configureCell(gallery)
            return cell
        }

        return UICollectionViewCell()
    }
}

extension GalleryViewController:UICollectionViewDelegate{
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print(#function)
    }
}

extension GalleryViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let count: Int = 3
        let spacing: CGFloat = 10.0 * CGFloat(count)
        let width: CGFloat = (UIScreen.main.bounds.width - spacing) / CGFloat(count)
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
