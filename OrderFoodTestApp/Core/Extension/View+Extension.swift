//
//  View+Extension.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 02.07.2023.
//

import SwiftUI

extension View {
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
