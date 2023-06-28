//
//  NetworkModel.swift
//  DeliveryTestApp
//
//  Created by Нияз Нуруллин on 23.06.2023.
//

import Foundation

struct CategoriesJSONModel: Codable {
    let сategories: [CategoryJSONData]
}

struct CategoryJSONData: Codable {
    let id: Int
    let name: String
    let imageURL:String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageURL = "image_url"
    }
}

struct DishesJSONModel: Codable {
    let dishes: [DishJSONData]
}

struct DishJSONData: Codable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let imageURL:String
    let tags: [String]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "price"
        case weight = "weight"
        case description = "description"
        case imageURL = "image_url"
        case tags = "tegs"
    }
}
