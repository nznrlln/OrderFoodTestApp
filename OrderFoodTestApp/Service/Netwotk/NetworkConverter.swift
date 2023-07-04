//
//  NetworkHelper.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 30.06.2023.
//

import Foundation

protocol NetworkConverterProtocol {
    func getCategoriesModel(data: CategoriesJSONModel?,complition: @escaping ([CategoryModel]?) -> Void)
    func getDishesModel(data: DishesJSONModel?, complition: @escaping ([DishModel]?, [String]?) -> Void)
}

final class NetworkConverter: NetworkConverterProtocol {

    let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func getCategoriesModel(data: CategoriesJSONModel?, complition: @escaping ([CategoryModel]?) -> Void) {
        guard let data = data else { return }

        var categories = [CategoryModel]()

        let group = DispatchGroup()

        data.сategories.forEach { categoryData in

            DispatchQueue.global().sync {
                group.enter()

                networkManager.getImage(stringUrl: categoryData.imageURL) { image in
                    guard let image = image else { return }

                    let newCategory = CategoryModel(
                        id: categoryData.id,
                        name: categoryData.name,
                        image: image
                    )

                    categories.append(newCategory)
                    if categories.count == data.сategories.count {
                        complition(categories)
                    }

                    group.leave()
                }
                group.wait()
            }
        }
    }

    func getDishesModel(data: DishesJSONModel?, complition: @escaping ([DishModel]?, [String]?) -> Void) {
        guard let data = data else { return }

        var dishes = [DishModel]()
        var tags = [String]()

        let group = DispatchGroup()

        data.dishes.forEach { dishData in

            DispatchQueue.global().sync {
                group.enter()

                networkManager.getImage(stringUrl: dishData.imageURL) { image in
                    guard let image = image else { return }
                    let newDish = DishModel(
                        id: dishData.id,
                        name: dishData.name,
                        price: dishData.price,
                        weight: dishData.weight,
                        description: dishData.description,
                        image: image,
                        tags: dishData.tags
                    )

                    dishes.append(newDish)
                    tags.append(contentsOf: newDish.tags)

                    if dishes.count == data.dishes.count {
                        let uniqueTags = Array(Set(tags))

                        complition(dishes, uniqueTags)
                    }

                    group.leave()
                }
                group.wait()
            }
        }

    }

}

