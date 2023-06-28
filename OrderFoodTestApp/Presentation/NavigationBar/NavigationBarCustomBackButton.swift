//
//  NavigationBarCustomBackButton.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 01.07.2023.
//

import SwiftUI

struct NavigationBarCustomBackButton: View {

    var backButtonTapAction: (() -> ())?

    var body: some View {
        backButton
    }

    var backButton: some View {
        Button {
            backButtonTapAction?()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(Palette.mainTextColor)
                .frame(width: 44, height: 44)
        }
    }
}

struct NavigationBarCustomBackButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarCustomBackButton()
    }
}
