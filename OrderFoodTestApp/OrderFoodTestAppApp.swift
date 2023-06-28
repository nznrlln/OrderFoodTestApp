//
//  OrderFoodTestAppApp.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 28.06.2023.
//

import SwiftUI

@main
struct OrderFoodTestAppApp: App {

    var body: some Scene {
        WindowGroup {
            TabView {
                MainScreenView(viewModel: MainScreenViewModel())
                .tabItem {
                    Label {
                        Text("Главная")
                    } icon: {
                        Image(uiImage: UIImage(named: "HomePageIcon") ?? UIImage())
                    }
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Palette.mainBackgroundColor, for: .tabBar)

                EmptyView()
//                CategoryScreenView(viewModel: CategoryScreenViewModel(categotyName: "nla"))
                    .tabItem {
                        Label {
                            Text("Поиск")
                        } icon: {
                            Image(uiImage: UIImage(named: "SearchPageIcon") ?? UIImage())
                        }
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(Palette.mainBackgroundColor, for: .tabBar)

                OrderScreenView(viewModel: OrderScreenViewModel())
                    .tabItem {
                        Label {
                            Text("Корзина")
                        } icon: {
                            Image(uiImage: UIImage(named: "OrderPageIcon") ?? UIImage())
                        }
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(Palette.mainBackgroundColor, for: .tabBar)

                EmptyView()
                    .tabItem {
                        Label {
                            Text("Аккаунт")
                        } icon: {
                            Image(uiImage: UIImage(named: "ProfilePageIcon") ?? UIImage())
                        }
                    }
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarBackground(Palette.mainBackgroundColor, for: .tabBar)

            }
        }
    }
}
