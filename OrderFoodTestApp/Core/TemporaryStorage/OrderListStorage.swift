//
//  OrderListManager.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 03.07.2023.
//

import Foundation
import SwiftUI

final class OrderListStorage: ObservableObject {

    var orderList: [OrderItemModel]

    var orderSum: Int {
        var sum = 0
        orderList.forEach { item in
            sum += item.itemSum
        }

        return sum
    }

    static let shared = OrderListStorage()

    private init() {
        orderList = []
    }
}
