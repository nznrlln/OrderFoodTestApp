//
//  MenuItemView.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 29.06.2023.
//

import SwiftUI

struct DishItemView: View {
    
    // data needed to fill the row
    let dish: DishModel

    // size
    private let cellWidth: CGFloat = 109
    private let cellHeight: CGFloat = 109
    private let cellRadius: CGFloat = 10

    var body: some View {

        VStack(spacing: 5) {
            dishImage

            dishText
        }
    }

    var dishImage: some View {
        dish.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(10)
            .frame(width: cellWidth, height: cellHeight)
            .background(Palette.secondaryBackgroundColor)
            .cornerRadius(cellRadius)
    }

    var dishText: some View {
        Text(dish.name)
            .font(Fonts.sfuiDisplayReg14)
            .foregroundColor(Palette.mainTextColor)
            .frame(width: cellWidth, alignment: .leading)
            .multilineTextAlignment(.leading)
    }
}

struct DishItemView_Previews: PreviewProvider {
    static var previews: some View {
        DishItemView(dish: DishModel(id: 1, name: "dish", price: 23, weight: 23, description: "", image: Image(systemName: "location"), tags: []))
    }
}
