//
//  ButtonGridSwiftUI.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 20.12.2023.
//

import Foundation
import SwiftUI

let layout = [
        GridItem(.fixed(74)),
        GridItem(.fixed(74))
]

let buttonCollection = [
    ButtonInfo(text: "Kaspi QR", icon: Image("qrButton")),
    ButtonInfo(text: "Магазин", icon: Image("shopButton")),
    ButtonInfo(text: "Мой Банк", icon: Image("myBankButton")),
    ButtonInfo(text: "Travel", icon: Image("travelButton")),
    ButtonInfo(text: "Платежи", icon: Image("historyButton")),
    ButtonInfo(text: "Госуслуги", icon: Image("egovButton")),
    ButtonInfo(text: "Переводы", icon: Image("transferButton")),
    ButtonInfo(text: "Объявления", icon: Image("adsButton")),
]

struct ButtonInfo:Identifiable{
    let id=UUID()
    let text:String
    let icon:Image
//    let action: (()->Void)?=nil
}

var gridBody: some View {
    LazyHGrid(rows: layout, spacing: 25) {
            ForEach(buttonCollection) { button in
                Button(action: doNothing){
                    VStack {
                        button.icon
                        Text(button.text)
                            .font(Font.custom("Roboto", size: 14))
                            .foregroundColor(.black)
                        }
                }.frame(width: 74,height: 56)
            }
        }
    }
