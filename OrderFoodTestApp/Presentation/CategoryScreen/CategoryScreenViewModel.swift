//
//  CategoryMenuScreenViewModel.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 30.06.2023.
//

import Foundation

protocol CategoryScreenViewModelProtocol: ObservableObject {
    var categotyName: String { get }
    var tags: [String] { get }
    var dishes: [DishModel] { get }

    var selectedTag: String { get set }
    var filteredDishes: [DishModel] { get }
    var showDishDetails: Bool { get set }
    var selectedDish: DishModel? { get set }

    var orderListStorage: OrderListStorage { get }

    func fetchDishes()
    func filterDishes()

    func addToOrder(dish: DishModel)
}

final class CategoryScreenViewModel: CategoryScreenViewModelProtocol  {

    @Published private(set) var categotyName: String
    @Published private(set) var tags: [String] = []
    @Published private(set) var dishes: [DishModel] = []

    @Published var selectedTag: String = "Все меню" {
        didSet {
            filterDishes()
        }
    }
    @Published private(set) var filteredDishes: [DishModel] = []
    @Published var showDishDetails = false
    @Published var selectedDish: DishModel? = nil

    private let networkManager = NetworkManager()
    private lazy var networkConverter = NetworkConverter(networkManager: self.networkManager)

    let orderListStorage = OrderListStorage.shared

    init(categotyName: String) {
        self.categotyName = categotyName
    }

    func fetchDishes()  {

        networkManager.getDishes { [weak self] dishes in
            self?.networkConverter.getDishesModel(data: dishes) { models, tags in
                guard let models = models else { return }
                guard let tags = tags else { return }

                let sortedModels = models.sorted { $0.id < $1.id }
                let sortedTags = tags.sorted { $0 < $1 }

                DispatchQueue.main.async {
                    self?.dishes = sortedModels
                    self?.filteredDishes = sortedModels
                    self?.tags = sortedTags
                }
            }
        }
    }

    func filterDishes() {
        let filtered = self.dishes.filter { [weak self] in
            $0.tags.contains(self?.selectedTag ?? "Все меню")
        }

        self.filteredDishes = filtered
    }

    func addToOrder(dish: DishModel) {
        if !orderListStorage.orderList.contains(where: { orderItem in
            orderItem.dish.id == dish.id
        }) {
            let newOrderItem = OrderItemModel(dish: dish, orderCount: 1)
            orderListStorage.orderList.append(newOrderItem)
        }

        debugPrint(orderListStorage.orderList)
    }
}
