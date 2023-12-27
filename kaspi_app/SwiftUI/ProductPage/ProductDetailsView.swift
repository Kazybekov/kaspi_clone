//
//  ImageView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 22.12.2023.
//

import SwiftUI

struct ProductPriceView: View {
    let product:Product
    var body: some View {
        HStack{
            Text(getStringFromInt(int: product.price))
            .font(Font.system(size: 18,weight: .bold))
            .foregroundColor(.black.opacity(0.75))
            Spacer()
            
            HStack{
                Text("В рассрочку")
                .font(Font.custom("Roboto", size: 12))
                .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                
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
            
            
        }.padding()
    }
}

struct ProductNameView: View {
    let product:Product
    var body: some View {
        
        VStack(alignment: .leading){
            HStack(){
                Text(product.name)
                .font(Font.custom("Roboto", size: 18))
                Spacer()
                HStack(spacing:16){
                    Image("heart")
                    Image("import")
                }
            }
            HStack(){
                HStack(spacing:0){
                    Image("star")
                    Image("star")
                    Image("star")
                    Image("star")
                    Image("star")
                }
                Spacer()
                
                Text("Код товара: 1283912374" )
                .font(Font.custom("Roboto", size: 12))
                .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                
            }
        }.padding(.horizontal)
    }
}


struct productPhoto: View{
    let product:Product
    var body: some View {
        ZStack(alignment: .leading){
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(height: UIScreen.main.bounds.size.width-32)
                .padding(.horizontal,16)
            VStack(spacing: 6){
                Text(product.bonus)
                    .multilineTextAlignment(.center)
                    .frame(width: 62, height: 31)
                    .background(Rectangle().fill(Color(red: 0.35, green: 0.62, blue: 0.02)).cornerRadius(14))
                    .font(Font.system(size: 12))
                    .foregroundColor(.white)
                if product.credit0012{
                    Text("0:0:12")
                        .multilineTextAlignment(.center)
                        .frame(width: 62, height: 31)
                        .background(Rectangle().fill(.red).cornerRadius(14))
                        .font(Font.system(size: 12))
                        .foregroundColor(.white)
                }
            }.padding(.top,-150)
                .padding(.leading,5)
            
        }
    }
}

