//
//  DeliveryView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 23.12.2023.
//

import SwiftUI

struct ProceedDeliveryView: View{
    var body: some View{
        HStack{
            Button(action: doNothing){
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 0.64, green: 0.86, blue: 0.36))
                        .cornerRadius(2)
                    Text("Оформить сейчас")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(.white)
                    }
            }.frame(width: (UIScreen.main.bounds.size.width-26)/2,height: 52)
            Button(action: doNothing){
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 0, green: 0.55, blue: 0.81))
                        .cornerRadius(2)
                    Text("Добавить в корзину")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(.white)
                    }
            }.frame(width: (UIScreen.main.bounds.size.width-26)/2,height: 52)
            
        }
    }
}

struct ShopListView: View{
    let product: Product
    var body: some View{
        DeliveryInfoView(product: product)
        RectangleSpacer(heigth:2.0)
        DeliveryInfoView(product: product)
        RectangleSpacer(heigth:2.0)
        DeliveryInfoView(product: product)
        RectangleSpacer(heigth:2.0)
    }
}

struct DeliveryInfoView: View{
    let product: Product
    var body: some View{
        VStack{
            HStack{
                VStack(alignment: .leading,spacing:0){
                    Text("KORKEM KZ")
                    .font(Font.custom("Roboto", size: 18))
                    .foregroundColor(.black.opacity(0.75))
                    HStack(spacing: 0){
                        Image("greenStar")
                        Image("greenStar")
                        Image("greenStar")
                        Image("greenStar")
                        Image("greenStar")
                        Text("(1 отзыв)")
                        .font(Font.custom("Roboto", size: 12))
                        .foregroundColor(.black.opacity(0.75))
                        .padding(.top,7)
                    }
                }
                Spacer()
                Button(action: doNothing){
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(red: 0, green: 0.55, blue: 0.81))
                            .cornerRadius(2)
                        Text("Выбрать")
                            .font(Font.custom("Roboto", size: 14))
                            .foregroundColor(.white)
                        }
                }.frame(width: 108,height: 31)
                
                
                
            }.padding(.horizontal)
            HStack{
                VStack(alignment: .leading,spacing: 0){
                    Text(getStringFromInt(int: product.price))
                    .font(Font.system(size: 13,weight: .bold))
                    .foregroundColor(.black.opacity(0.75))
                    
                        HStack(spacing:3){
                            Text(getStringFromInt(int: product.price/6))
                                .font(Font.system(size: 12,weight: .bold))
                                .foregroundColor(.black)
                                .background(Rectangle().fill(Color(red: 1, green: 0.81, blue: 0)))
                            Text("x6")
                                .font(Font.system(size: 13))
                                .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                        }
                    
                }
                Spacer()
                VStack(alignment:.leading){
                    HStack{
                        Image("delivery")
                        Text("Postomat, **1 декабря**, бесплатно")
                            .font(Font.system(size: 12))
                            .foregroundColor(.black.opacity(0.75))
                    }
                    HStack{
                        Image("truck")
                        Text("Доставка, **1 декабря**,бесплатно")
                            .font(Font.system(size: 12))
                            .foregroundColor(.black.opacity(0.75))
                        
                    }
                    
                }
                
            }.padding(.horizontal)
        }.padding(.vertical)
    }
}

struct DeliveryFilterView: View{
    var body: some View{
        HStack(){
            Text("Доставка")
            .font(Font.custom("Roboto", size: 14))
            .foregroundColor(.black.opacity(0.75))
            
            Spacer()
            HStack{
                ZStack{
                    Capsule().fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 86, height: 27)
                            .overlay{
                                Capsule()
                                    .fill(.white)
                                    .frame(width: 84, height: 25)
                            }
                    Text("До 5 дней")
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(.black.opacity(0.75))
                }
                ZStack{
                    Capsule().fill(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .frame(width: 86, height: 27)
                            .overlay{
                                Capsule()
                                    .fill(.white)
                                    .frame(width: 84, height: 25)
                            }
                    Text("До 7 дней")
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(.black.opacity(0.75))
                }
            }
        }.padding(.horizontal)
            .frame(height: 36)
    }
}
