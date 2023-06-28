//
//  NavigationBarLeadingItems.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 01.07.2023.
//

import SwiftUI

struct NavigationBarLeadingItems: View {

    var cityName: String
    var date: String

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            locationButton
            dateText
        }
    }

    var locationButton: some View {
        Button {
            debugPrint("LocationTapped")
        } label: {
            Image(uiImage: UIImage(named: "LocationIcon") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 24, height: 24)
                .clipShape(Circle()
                )
            Text(cityName)
                .foregroundColor(Palette.mainTextColor)
                .font(Fonts.sfuiDisplayMed18)
        }
    }

    var dateText: some View {
        Text(date)
            .foregroundColor(Palette.secondaryTextColor)
            .font(Fonts.sfuiDisplayReg14)
    }

}

struct NavigationBarLeadingItems_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarLeadingItems(cityName: "Санкт-Петербург", date: "12 Августа, 2023")
    }
}
