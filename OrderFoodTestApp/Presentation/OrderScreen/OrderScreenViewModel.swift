//
//  OrderScreenViewModel.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 02.07.2023.
//

import Foundation

protocol OrderScreenViewModelProtocol: ObservableObject {
    var cityName: String { get }
    var currentDate: String { get }
    var orderList: [OrderItemModel] { get }
    var orderSum: Int { get }

    func fetchOrderList()
    func getDate()

    func increaseCount(item: OrderItemModel)
    func decreaseCount(item: OrderItemModel)
}

final class OrderScreenViewModel: OrderScreenViewModelProtocol  {
    @Published private(set) var cityName: String = "Санкт-Петербург"
    @Published private(set) var currentDate: String = ""
    @Published var orderList = OrderListStorage.shared.orderList
    @Published var orderSum = OrderListStorage.shared.orderSum


    func fetchOrderList() {
        orderList = OrderListStorage.shared.orderList
        orderSum = OrderListStorage.shared.orderSum
    }

    func increaseCount(item: OrderItemModel) {
        OrderListStorage.shared.orderList.first(where: {$0 === item})?.orderCount += 1

        fetchOrderList()
    }

    func decreaseCount(item: OrderItemModel) {
        guard let storageItem = orderList.first(where: {$0 === item}) else { return }

        if storageItem.orderCount <= 1 {
            OrderListStorage.shared.orderList.removeAll(where: {$0 === item})
        } else {
            OrderListStorage.shared.orderList.first(where: {$0 === item})?.orderCount -= 1
        }
        fetchOrderList()
    }

    func getDate() {
        self.currentDate = DateHelper.shared.getCurrentDate()
    }
}
