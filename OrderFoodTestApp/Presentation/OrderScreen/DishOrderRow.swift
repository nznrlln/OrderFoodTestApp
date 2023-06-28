//
//  ItemOrderRow.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 30.06.2023.
//

import SwiftUI

struct DishOrderRow: View {
    // data needed to fill the row
    var orderItem: OrderItemModel

    var minusButtonTapAction: (() -> ())?
    var plusButtonTapAction: (() -> ())?

    var body: some View {
        HStack(spacing: 8) {
            dishImage
            dishDiscription
            Spacer()
            countView
        }

    }

    private var dishImage: some View {
        orderItem.dish.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(8)
            .frame(width: 62, height: 62)
            .background(Palette.secondaryBackgroundColor)
            .cornerRadius(6)
    }

    private var dishDiscription: some View {
        VStack(alignment: .leading, spacing: 4) {
            dishName
            HStack {
                dishPrice
                Text("·").foregroundColor(Palette.secondaryTextColor)
                dishWeight
            }
        }
    }

    private var dishName: some View {
        Text(orderItem.dish.name)
            .font(Fonts.sfuiDisplayMed16)
            .foregroundColor(Palette.mainTextColor)
    }

    private var dishPrice: some View {
        Text(String(orderItem.dish.price))
            .font(Fonts.sfuiDisplayReg14)
            .foregroundColor(Palette.mainTextColor)
    }

    private var dishWeight: some View {
        Text(String(orderItem.dish.weight))
            .font(Fonts.sfuiDisplayReg14)
            .foregroundColor(Palette.secondaryTextColor)
    }

    private var countView: some View {
        HStack(spacing: 16) {

            minusButton

            Text(String(orderItem.orderCount)) // count

            plusButton
        }
        .padding(.horizontal, 6)
        .padding(.vertical, 4)
        .background(Palette.secondaryBackgroundColor)
        .cornerRadius(10)
    }

    private var minusButton: some View {
        Button {
            debugPrint("minus button")
            self.minusButtonTapAction?()
        } label: {
            Image(systemName: "minus")
                .foregroundColor(Palette.mainTextColor)
                .frame(width: 25, height: 24)
                .background(Palette.secondaryBackgroundColor)
        }
    }

    private var plusButton: some View {
        Button {
            debugPrint("plus button")
            self.plusButtonTapAction?()
        } label: {
            Image(systemName: "plus")
                .foregroundColor(Palette.mainTextColor)
                .frame(width: 25, height: 24)
                .background(Palette.secondaryBackgroundColor)
        }
    }
}

struct DishOrderRow_Previews: PreviewProvider {

    static var item = OrderItemModel(dish: DishModel(id: 1, name: "dish", price: 23, weight: 23, description: "", image: Image(systemName: "location"), tags: []), orderCount: 1)
    
    static var previews: some View {
        DishOrderRow(orderItem: item)
    }
}
