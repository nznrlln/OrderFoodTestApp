//
//  ContentView.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 28.06.2023.
//

import SwiftUI

struct MainScreenView<VM : MainScreenViewModelProtocol>: View {

    @StateObject private var viewModel: VM

    private let gridLayout = [
        GridItem(.fixed(UIScreen.main.bounds.width - 32), spacing: 8)
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                categoriesCollection
            }
            .padding(.top, 16)
            .background(Palette.mainBackgroundColor)

            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationBarLeadingItems(
                        cityName: viewModel.cityName,
                        date: viewModel.currentDate
                    )
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationBarTrailingItems {
                        debugPrint("userImageTapped")
                    }
                }
            }
        }
        .onViewDidLoad {
            viewModel.getDate()
            viewModel.fetchCategories()
        }
    }

    private var categoriesCollection: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(viewModel.categories) { category in
                NavigationLink {
                    CategoryScreenView(
                        viewModel: CategoryScreenViewModel(
                            categotyName: category.name
                        )
                    )
                } label: {
                    CategoryRowView(category: category)
                }
            }
        }
    }


    init (viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView(viewModel: MainScreenViewModel())
    }
}
