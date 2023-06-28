//
//  CategoryMenuScreenView.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 28.06.2023.
//

import SwiftUI

struct CategoryScreenView<VM : CategoryScreenViewModelProtocol>: View {
    @Environment(\.dismiss) var dismiss

    @StateObject private var viewModel: VM

    private let hGridLayout = [
        GridItem(.adaptive(minimum: 35), spacing: 8)
    ]
    private let vGridLayout = [
        GridItem(.adaptive(minimum: 109), spacing: 16, alignment: .top)
    ]

    var body: some View {
        ZStack {
            NavigationView {

                ScrollView(.vertical, showsIndicators: false) {

                    ScrollView(.horizontal, showsIndicators: false) {
                        tagsCollection
                    }
                    .padding(.top, 8)
                    .padding(.leading, 16)
                    .background(Palette.mainBackgroundColor)

                    Spacer(minLength: 16)

                    dishesCollection
                }
                .padding(.top, 8)
                .background(Palette.mainBackgroundColor)
                .onViewDidLoad {
                    viewModel.fetchDishes()
                }


                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(viewModel.categotyName)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationBarCustomBackButton {
                            dismiss()
                        }
                    }

                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationBarTrailingItems()
                    }
                }

            }
            .navigationBarBackButtonHidden(true)

            if viewModel.showDishDetails,
               viewModel.selectedDish != nil {

                DishDetailsView(
                    isPresented: $viewModel.showDishDetails,
                    orderButtonTapAction: {
                        viewModel.addToOrder(dish: viewModel.selectedDish!)
                    }, dish: viewModel.selectedDish!)
            }
        }

    }

    private var tagsCollection: some View {
        LazyHGrid(rows: hGridLayout) {
            ForEach(viewModel.tags, id: \.self) { tag in
                Button {
                    viewModel.selectedTag = tag
                    debugPrint(viewModel.selectedTag)
                } label: {
                    CategotyTagView(
                        selectedTag: $viewModel.selectedTag,
                        tag: tag
                    )
                }
            }
        }
        .background(Palette.mainBackgroundColor)
    }

    private var dishesCollection: some View {
        LazyVGrid(columns: vGridLayout) {
            ForEach(viewModel.filteredDishes) { dish in
                Button {
                    withAnimation {
                        viewModel.showDishDetails.toggle()
                        viewModel.selectedDish = dish
                    }
                } label: {

                    DishItemView(dish: dish)

                }
            }

        }
        .padding(.horizontal, 16)
        .background(Palette.mainBackgroundColor)
    }

    init (viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

}


struct CategoryScreenView_Previews: PreviewProvider {
    static var storage = OrderListStorage.shared
    static var previews: some View {
        CategoryScreenView(viewModel: CategoryScreenViewModel(categotyName: "Asian food"))

    }
}
