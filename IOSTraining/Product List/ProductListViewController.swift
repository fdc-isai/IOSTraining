//
//  ProductListViewController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/9/25.
//

import UIKit
import Combine
import SwiftUI

class ProductListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var products: [Product] = []
    let cellIdentifier = "ProductCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

        NetworkManager.shared.getProducts { response in
            self.products = response.products

            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }

        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }

}


extension ProductListViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellIdentifier,
            for: indexPath
        ) as? ProductCell {
            let product = products[indexPath.item]
            cell.configureCell(product)
            return cell
        }

        return UICollectionViewCell()
    }
}

extension ProductListViewController:UICollectionViewDelegate{
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {

        let vc = UIHostingController(
            rootView: ProductDetailSwiftUI(
                productId: products[indexPath.row].id,
                viewModel: ProductDetailModelView()
            )
        )
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProductListViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let count: Int = 2
        let spacing: CGFloat = 5.0 * CGFloat(count)
        let width: CGFloat = (UIScreen.main.bounds.width - spacing) / CGFloat(count)
        return CGSize(width: width, height: 320)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
