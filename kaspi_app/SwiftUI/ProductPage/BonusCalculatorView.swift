//
//  BonusCalculatorView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 23.12.2023.
//

import SwiftUI

struct CalculatorView: View{
    
    var body: some View{
        HStack{
            Text("В рассрочку")
            .font(Font.custom("Roboto", size: 12))
            .foregroundColor(.black.opacity(0.75))
            Spacer()
            HStack(alignment: .center,spacing: -0){
                ZStack{
                    Rectangle()
                        .frame(width: 61,height: 28)
                        .foregroundColor(Color(.white))
                        .border(.red,width: 1)
                        .cornerRadius(2)
                    Text("3 мес")
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(Color(red: 0.98, green: 0.26, blue: 0.19))
                }
                ZStack{
                    Rectangle()
                        .frame(width: 61,height: 28)
                        .foregroundColor(Color(.red))
                        .border(.red,width: 1)
                        .cornerRadius(2)
                    Text("6 мес")
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(Color(.white))
                }
                ZStack{
                    Rectangle()
                        .frame(width: 61,height: 28)
                        .foregroundColor(Color(.white))
                        .border(.red,width: 1)
                        .cornerRadius(2)
                    Text("12 мес")
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(Color(red: 0.98, green: 0.26, blue: 0.19))
                }
            }
        }.padding(.horizontal)
    }
}

struct BonusView:View{
    
    var body: some View{
        ZStack{
            Rectangle()
                .frame(height: 54)
                .foregroundColor(Color(red: 0.35, green: 0.62, blue: 0.02))
            
            HStack(spacing: 16){
                Text("5%")
                    .font(Font.system(size: 13,weight: .bold))
                    .foregroundColor(Color(red: 0.35, green: 0.62, blue: 0.02))
                    .background(Circle().fill(Color(.white)).frame(width: 30,height: 30))
                

                Text("5% Бонусов при оплате Kaspi Gold!\nБонусы будут начислены после получения товара.")
                .font(Font.custom("Roboto", size: 12))
                .foregroundColor(.white)
            }
        }.padding(.top,-10)
       
            
    }
}


