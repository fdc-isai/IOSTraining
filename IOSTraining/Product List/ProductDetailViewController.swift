//
//  ProductDetailViewController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/12/25.
//

import UIKit

class ProductDetailViewController: UIViewController {

    var productId: Int?
    var product: Product?

    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productNameView: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "product Detail"

        guard let id = productId else {
            print("No product ID provided")
            return
        }

        NetworkManager.shared.getProductDetail(id: id) { response in
            self.product = response

            DispatchQueue.main.async {
                self.loadProductDetail()
            }
        }

        // Do any additional setup after loading the view.
    }


    func loadProductDetail() {

        guard let product = self.product else { return }

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

        productNameView.text = product.title
        productDescription.text = product.description

    }

}
