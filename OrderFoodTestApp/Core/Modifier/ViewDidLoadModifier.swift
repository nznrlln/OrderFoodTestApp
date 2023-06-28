//
//  ViewDidLoadModifier.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 02.07.2023.
//

import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    @State private var viewDidLoad = false
    let action: (() -> Void)?

    func body(content: Content) -> some View {
        content
            .onAppear {
                if viewDidLoad == false {
                    viewDidLoad = true
                    action?()
                }
            }
    }
}
