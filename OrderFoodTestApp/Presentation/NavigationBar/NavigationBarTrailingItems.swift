//
//  NavigationBarTrailingItems.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 01.07.2023.
//

import SwiftUI

struct NavigationBarTrailingItems: View {

    var userImageTapAction: (() -> ())?
    
    var body: some View {
        VStack {
            userImageButton
        }
    }

    var userImageButton: some View {
        // uncomment to make a button
//        Button {
//            self.userImageTapAction?()
//        } label: {
            Image(uiImage: UIImage(named: "UserImage") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 44, height: 44)
                .clipShape(Circle())
//        }
    }
}



struct NavigationBarTrailingItems_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarTrailingItems()
    }
}
