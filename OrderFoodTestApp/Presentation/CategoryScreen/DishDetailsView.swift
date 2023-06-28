//
//  ItemDetailsView.swift
//  OrderFoodTestApp
//
//  Created by Нияз Нуруллин on 29.06.2023.
//

import SwiftUI

struct DishDetailsView: View {

    @Binding var isPresented: Bool

    var likeButtonTapAction: (() -> ())?
    var orderButtonTapAction: (() -> ())?

    // data needed to fill the row
    let dish: DishModel

    // view size
    private let viewRadius: CGFloat = 15

    // image size
    private let imageWidth: CGFloat = UIScreen.main.bounds.width - 64
    private let imageHeight: CGFloat = 232
    private let imageRadius: CGFloat = 10

    var body: some View {

        ZStack(alignment: .center) {

            VStack(spacing: 8) {

                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    dishImage
                    HStack {
                        likeButton
                        closeButton
                    }
                    .padding(8)
                }

                dishName

                HStack {
                    dishPrice
                    Text("·").foregroundColor(Palette.secondaryTextColor)
                    dishWeight
                    Spacer()
                }
                .frame(width: imageWidth)
//                .padding(.horizontal, 16)

                dishDescription

                orderButton
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .background(Palette.mainBackgroundColor)
            .cornerRadius(viewRadius)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.black
                .opacity(0.5)
                .onTapGesture {
                    isPresented.toggle()
                }
        )
        .ignoresSafeArea(edges: .top)


    }

    var dishImage: some View {
        dish.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(14)
            .frame(width: imageWidth, height: imageHeight)
            .background(Palette.secondaryBackgroundColor)
            .cornerRadius(imageRadius)
    }

    private var likeButton: some View {
        Button {
            self.likeButtonTapAction?()
        } label: {
            Image(systemName: "heart")
                .foregroundColor(Palette.mainTextColor)
                .padding(10)
                .background(Palette.mainBackgroundColor)
                .cornerRadius(8)
        }
    }

    private var closeButton: some View {
        Button {
            withAnimation {
                isPresented.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(Palette.mainTextColor)
                .padding(10)
                .background(Palette.mainBackgroundColor)
                .cornerRadius(8)
        }
    }

    private var dishName: some View {
        Text(dish.name)
            .font(Fonts.sfuiDisplayMed16)
            .foregroundColor(Palette.mainTextColor)
            .frame(width: imageWidth, alignment: .leading)
    }

    private var dishPrice: some View {
        Text(String(dish.price))
            .font(Fonts.sfuiDisplayReg14)
            .foregroundColor(Palette.mainTextColor)
    }

    private var dishWeight: some View {
        Text(String(dish.weight))
            .font(Fonts.sfuiDisplayReg14)
            .foregroundColor(Palette.secondaryTextColor)
    }

    private var dishDescription: some View {
        Text(dish.description)
            .font(Fonts.sfuiDisplayReg14)
            .foregroundColor(Palette.mainTextColor)
            .frame(width: imageWidth, alignment: .leading)
    }

    private var orderButton: some View {
        Button {
            orderButtonTapAction?()
            isPresented.toggle()
        } label: {
            Text("Добавить в корзину")
                .font(Fonts.sfuiDisplayMed16)
                .foregroundColor(.white)
                .padding(.horizontal, 82)
                .padding(.vertical, 15)
        }
        .frame(width: imageWidth, height: 48, alignment: .center)
        .background(Palette.accentColor)
        .cornerRadius(imageRadius)
    }

    
}

////  background blur  view
////  uncomment to use
//struct BlurView: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> UIVisualEffectView {
//        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
//
//    }
//
//}

struct DishDetailsView_Previews: PreviewProvider {
    @State static var present = true
    static var previews: some View {
        DishDetailsView(isPresented: $present, dish: DishModel(id: 1, name: "dish", price: 23, weight: 23, description: "kbndfkbmdfkmbdfmb dkbmfkdbmdfmb fdk mfk mdofbmdfkbmokm", image: Image(systemName: "location"), tags: []))
            .previewLayout(.sizeThatFits)
    }
}
