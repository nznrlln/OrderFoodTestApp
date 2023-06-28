//
//  CategoryRowView.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 28.06.2023.
//

import SwiftUI

struct CategoryRowView: View {
    
    // data needed to fill the row
    let category: CategoryModel

    // size
    private let imageWidth: CGFloat = UIScreen.main.bounds.width - 32
    private let imageHeight: CGFloat = 148

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            categoryImage
            categoryName
        }
    }

    var categoryImage: some View {
        category.image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: imageWidth, height: imageHeight)
            .cornerRadius(24)
    }

    var categoryName: some View {
        Text("\(category.name)")
            .font(Fonts.sfuiDisplayMed20)
            .foregroundColor(Palette.mainTextColor)
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 0))
    }
}

struct CategoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowView(category: CategoryModel(id: 1, name: "Category", image: Image(systemName: "pin")))
    }
}
