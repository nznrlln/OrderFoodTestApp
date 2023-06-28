//
//  OrderScreenView.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 30.06.2023.
//

import SwiftUI

struct OrderScreenView<VM : OrderScreenViewModelProtocol>: View {

    @StateObject private var viewModel: VM

    private let cityLabel: String = "Санкт-Петербург"
    private let timeLabel: String = "12 Августа, 2023"

    // button size
    private let buttonWidth: CGFloat = UIScreen.main.bounds.width - 32
    private let buttonHeight: CGFloat = 48
    private let buttonRadius: CGFloat = 10

    private let gridLayout = [
        GridItem(.fixed(UIScreen.main.bounds.width - 32), spacing: 8)
    ]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                ScrollView {
                    orderList
                }
                .padding(.top, 16)
                .background(Palette.mainBackgroundColor)

                orderButton
            }

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
        .onViewDidLoad() {
            viewModel.getDate()
        }
        .onAppear {
            viewModel.fetchOrderList()
        }

    }

    private var orderList: some View {
        LazyVGrid(columns: gridLayout) {
            ForEach(viewModel.orderList, id: \.dish.id) { item in
                DishOrderRow(orderItem: item) {
                    viewModel.decreaseCount(item: item)
                } plusButtonTapAction: {
                    viewModel.increaseCount(item: item)
                }

            }
        }
    }

    private var orderButton: some View {
        Button {
            debugPrint("Orderd")
        } label: {
            HStack {
                Text("Оплатить")
                    .font(Fonts.sfuiDisplayMed16)
                    .foregroundColor(.white)

                Text(String(viewModel.orderSum))
                    .font(Fonts.sfuiDisplayMed16)
                    .foregroundColor(.white)

                Text("₽")
                    .font(Fonts.sfuiDisplayMed16)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 82)
            .padding(.vertical, 15)

        }
        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
        .background(Palette.accentColor)
        .cornerRadius(buttonRadius)
        .padding(.bottom, 16)
    }

    init (viewModel: VM) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

}

struct OrderScreenView_Previews: PreviewProvider {
    
    static var previews: some View {
        OrderScreenView(viewModel: OrderScreenViewModel())

    }
}
