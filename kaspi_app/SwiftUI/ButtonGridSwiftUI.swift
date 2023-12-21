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
    buttonInfo(text: "Kaspi QR", icon: Image("qrButton")),
    buttonInfo(text: "Магазин", icon: Image("shopButton")),
    buttonInfo(text: "Мой Банк", icon: Image("myBankButton")),
    buttonInfo(text: "Travel", icon: Image("travelButton")),
    buttonInfo(text: "Платежи", icon: Image("historyButton")),
    buttonInfo(text: "Госуслуги", icon: Image("egovButton")),
    buttonInfo(text: "Переводы", icon: Image("transferButton")),
    buttonInfo(text: "Объявления", icon: Image("adsButton")),
]

struct buttonInfo:Identifiable{
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
