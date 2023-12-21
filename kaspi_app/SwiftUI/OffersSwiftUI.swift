//
//  OffersSwiftUI.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 20.12.2023.
//

import Foundation
import SwiftUI


struct Offer: Identifiable {
    let id = UUID()
    var title:String
    var subTitle:String?
}

struct OfferView: View{
    let offer: Offer
    var body: some View {
        Button(action: doNothing){
            HStack{
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 61, height: 43)
                  .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                  .cornerRadius(6)
                
               
                VStack(alignment: .leading){
                    Text(offer.title)
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    
                    if let subTitle = offer.subTitle{
                        Text(subTitle)
                        .font(Font.custom("Roboto", size: 12))
                        .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                    }
                }
            }
        }
    }
}

let offers = [Offer(title: "Рассрочка 0-0-12"),
             Offer(title: "Kaspi Red",subTitle: "Рассрочка 0%" ),
              Offer(title: "Кредиты",subTitle: "до 1 миллиона" ),
               Offer(title: "Kaspi Депозит",subTitle: "Эффектиные" ),
              Offer(title: "Кредит На Покупки",subTitle: "Кредит или рассрочка 0%" )

]

var kaspiOffers: some View{
    
    ScrollView(.horizontal,showsIndicators: false){
        HStack(spacing:20){
            VStack(alignment: .leading){
                OfferView(offer: offers[0])
                OfferView(offer: offers[2])
                
            }.frame(width: 230)
            
            VStack(alignment: .leading){
                OfferView(offer: offers[1])
                OfferView(offer: offers[3])
            }.frame(width: 250)
            
            VStack(alignment: .trailing){
                OfferView(offer: offers[4])
                Spacer()
            }.frame(width: 250)
            
                
        }
    }
}

