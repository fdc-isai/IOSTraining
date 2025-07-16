//
//  ProductCell.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/9/25.
//

import UIKit
import Kingfisher

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceView: UILabel!
    @IBOutlet weak var productLabelView: UILabel!
    @IBOutlet weak var productBrandLabelView: UILabel!
    @IBOutlet weak var productDiscountLabelView: UILabel!
    @IBOutlet weak var productRatingLabelView: UILabel!
    @IBOutlet weak var productStockLabelView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }


    func configureCell (_ product: Product) {
        guard let url = URL(string: product.thumbnail ?? "https://placehold.co/400")
        else {
            return
        }

        productImageView.kf.indicatorType = .activity
        productImageView.kf.setImage(
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

        productLabelView.text = product.title
        productDiscountLabelView.text =  product.price != nil ? String(format: "$%.2f", product.price!) : "-"
        productBrandLabelView.text = product.brand ?? product.category

        if let price = product.price {
            let discount = product.discountPercentage ?? 0.0
            let discountedPrice = price - (price * discount / 100)
            productPriceView.text = String(format: "$%.2f", discountedPrice)
        } else {
            productPriceView.text = "-"
        }

    }

    func getRandomImage() -> UIImage {
        let names = ["furina", "raiden", "yelan", "nahida", "mavuika", "zhongli", "venti"]
        let randomName = names.randomElement() ?? ""
        return UIImage(named: "user_\(randomName)") ?? UIImage()
    }


}
