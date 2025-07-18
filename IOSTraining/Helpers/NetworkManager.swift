import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func getProducts(completion: @escaping (ProductResponse) -> Void) {
        let productResponse = ProductResponse(
            products: [],
            total: 0,
            skip: 0,
            limit: 0
        )
        AF.request("https://dummyjson.com/products")
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    do {
                        let tempData = try JSONSerialization.data(withJSONObject: data, options: [])
                        let decoder = JSONDecoder()
                        let products = try decoder.decode(ProductResponse.self, from: tempData)
                        completion(products)
                    } catch {
                        completion(productResponse)
                        print("Unable to serialize json object")
                    }
                case .failure(let error):
                    completion(productResponse)
                    print("Error: \(error)")
                }
            }
    }

    func getProductDetail(id: Int, completion: @escaping (Product) -> Void) {
        let product = Product(
            id: 0,
            title: "",
            description: "",
            brand: "",
            category: "",
            price: 0.00,
            thumbnail: "p_mascara",
            stock: 0,
            rating: 0.00,
            discountPercentage: 0.00,
            images: []
        )
        AF.request("https://dummyjson.com/products/\(id)")
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    do {
                        let tempData = try JSONSerialization.data(withJSONObject: data, options: [])
                        let decoder = JSONDecoder()
                        let product = try decoder.decode(Product.self, from: tempData)
                        completion(product)
                    } catch {
                        completion(product)
                        print("Unable to serialize json object")
                    }
                case .failure(let error):
                    completion(product)
                    print("Error: \(error)")
                }
            }
    }


    func getProductsByCategory (category: String, completion: @escaping (ProductResponse) -> Void) {
        let productResponse = ProductResponse(
            products: [],
            total: 0,
            skip: 0,
            limit: 0
        )
        AF.request("https://dummyjson.com/products/category/\(category)")
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    do {
                        let tempData = try JSONSerialization.data(withJSONObject: data, options: [])
                        let decoder = JSONDecoder()
                        let products = try decoder.decode(ProductResponse.self, from: tempData)
                        completion(products)
                    } catch {
                        completion(productResponse)
                        print("Unable to serialize json object")
                    }
                case .failure(let error):
                    completion(productResponse)
                    print("Error: \(error)")
                }
            }
    }

    func addToUserCart(userId: Int = 1, products: [(id: Int, quantity: Int)], completion: @escaping (Bool) -> Void) {
        let productDicts = products.map { ["id": $0.id, "quantity": $0.quantity] }

        let parameters: [String: Any] = [
            "userId": userId,
            "products": productDicts
        ]

        AF.request("https://dummyjson.com/carts/add", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Added to cart:", value)
                    completion(true)
                case .failure(let error):
                    print("Failed to add to cart:", error)
                    completion(false)
                }
            }
    }

    func fetchFavoriteProducts (userId: Int, sort: String, completion: @escaping (ProductResponse) -> Void) {
        let productResponse = ProductResponse(
            products: [],
            total: 0,
            skip: 0,
            limit: 0
        )
        AF.request("https://dummyjson.com/products?sortBy=\(sort)&order=asc")
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    do {
                        let tempData = try JSONSerialization.data(withJSONObject: data, options: [])
                        let decoder = JSONDecoder()
                        let products = try decoder.decode(ProductResponse.self, from: tempData)
                        completion(products)
                    } catch {
                        completion(productResponse)
                        print("Unable to serialize json object")
                    }
                case .failure(let error):
                    completion(productResponse)
                    print("Error: \(error)")
                }
            }
    }
}
