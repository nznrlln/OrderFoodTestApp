//
//  MainScreenViewModel.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 30.06.2023.
//

import Foundation

protocol MainScreenViewModelProtocol: ObservableObject {
    var cityName: String { get }
    var currentDate: String { get }
    var categories: [CategoryModel] { get }

    func fetchCategories()
    func getDate()
}

final class MainScreenViewModel: MainScreenViewModelProtocol  {
    @Published private(set) var cityName: String = "Санкт-Петербург"
    @Published private(set) var currentDate: String = ""
    @Published private(set) var categories: [CategoryModel] = []

    private let networkManager = NetworkManager()
    private lazy var networkConverter = NetworkConverter(networkManager: self.networkManager)

    func fetchCategories() {

        networkManager.getCategories { [weak self] categories in
            self?.networkConverter.getCategoriesModel(data: categories) { models in
                guard let models = models else { return }

                let sorted = models.sorted { $0.id < $1.id }

                DispatchQueue.main.async {
                    self?.categories = sorted
                }

            }
        }
    }

    func getDate() {
        self.currentDate = DateHelper.shared.getCurrentDate()
    }
}
