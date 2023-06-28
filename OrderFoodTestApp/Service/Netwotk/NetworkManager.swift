//
//  NetworkManager.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 30.06.2023.
//

import SwiftUI
import Alamofire

protocol NetworkManagerProtocol {
    func getCategories(complition: @escaping (CategoriesJSONModel?) -> Void)
    func getDishes(complition: @escaping (DishesJSONModel?) -> Void)
    func getImage(stringUrl: String, complition: @escaping (Image?) -> Void)

}

final class NetworkManager: NetworkManagerProtocol {

    private let categoriesStringUrl = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54"
    private let dishesStringUrl = "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b"

    func getCategories(complition: @escaping (CategoriesJSONModel?) -> Void) {
        guard let url = URL(string: categoriesStringUrl) else { complition(nil); return }
        let urlRequest = URLRequest(url: url)

        AF.request(urlRequest).responseJSON(queue: .global(qos: .utility)) { response in
            if let data = response.data {
                do {
                    let categories = try JSONDecoder().decode(CategoriesJSONModel.self, from: data)
                    complition(categories)
                } catch let error {
                    debugPrint("Error discription: \(error)")
                    complition(nil)
                }
            }
        }
    }

    func getDishes(complition: @escaping (DishesJSONModel?) -> Void) {
        guard let url = URL(string: dishesStringUrl) else { complition(nil); return }
        let urlRequest = URLRequest(url: url)

        AF.request(urlRequest).responseJSON(queue: .global(qos: .utility)) { response in
            if let data = response.data {
                do {
                    let dishes = try JSONDecoder().decode(DishesJSONModel.self, from: data)
                    complition(dishes)
                } catch let error {
                    debugPrint("Error discription: \(error)")
                    complition(nil)
                }
            }
        }
    }

    func getImage(stringUrl: String, complition: @escaping (Image?) -> Void) {
        guard let url = URL(string: stringUrl) else { complition(nil); return }
        let urlRequest = URLRequest(url: url)

        AF.request(urlRequest).response(queue: .global(qos: .background)) { response in
            guard let data = response.data else { complition(nil); return }

            let image = Image(uiImage: UIImage(data: data) ?? UIImage(named: "NoProductImage")!)
            complition(image)
        }
    }

}
