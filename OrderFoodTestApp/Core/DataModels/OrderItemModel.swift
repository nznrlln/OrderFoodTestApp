//
//  OrderItemModel.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 03.07.2023.
//

import Foundation

final class OrderItemModel {

    let dish: DishModel
    var orderCount: Int
    var itemSum: Int {
        dish.price * orderCount
    }

    init(dish: DishModel, orderCount: Int) {
        self.dish = dish
        self.orderCount = orderCount
    }
}
