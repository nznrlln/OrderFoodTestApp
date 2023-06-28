//
//  DishModel.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 30.06.2023.
//

import SwiftUI

struct DishModel: Identifiable {
    let id: Int
    let name: String
    let price: Int
    let weight: Int
    let description: String
    let image: Image
    let tags: [String]
}
