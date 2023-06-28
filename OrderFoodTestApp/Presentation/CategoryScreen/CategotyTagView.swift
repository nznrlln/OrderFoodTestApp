//
//  MenuFilterView.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 29.06.2023.
//

import Combine
import SwiftUI

struct CategotyTagView: View {

    @Binding var selectedTag: String

    // data needed to fill the row
    let tag: String
    
    // cell size
    private let cellRadius: CGFloat = 10

    var body: some View {
        tagText
    }

    var tagText: some View {
        Text(tag)
            .font(Fonts.sfuiDisplayReg14)
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background((tag == selectedTag) ? Palette.accentColor : Palette.secondaryBackgroundColor)
            .foregroundColor((tag == selectedTag) ? Color.white : Palette.mainTextColor)
            .cornerRadius(cellRadius)
    }


}

struct CategotyTagView_Previews: PreviewProvider {
    @State static var selectedTag = "fish"
    static var previews: some View {
        CategotyTagView(selectedTag: $selectedTag, tag: "fish")
    }
}
