//
//  SwiftUIView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 13.12.2023.
//

import SwiftUI
//import UIKit

enum ProductCardType{
    case large
    case small
}

struct SwiftUIView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(){
                    Spacer()
                    advertisments
                    rectangleSpacer(heigth: 12.0)
                    gridBody
                    rectangleSpacer(heigth: 2.0)
                    kaspiOffers
                    rectangleSpacer(heigth: 12.0)
                    LastVisitedView()
                }.frame(width: UIScreen.main.bounds.size.width)
            }
        }
            .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always), prompt:"Поиск по Kaspi.kz")
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Kaspi")
    }
}

struct LastVisitedView: View{
    var body: some View{
        VStack(alignment: .leading){
            
            Text("Вы недавно смотрели")
                .font(Font.system(size: 18,weight: .bold))
                .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 18){
                        ForEach(lastVisited) { visit in
                            ProductView(product: visit,type:.small)
                            }
                }.padding(.horizontal)
            }
            
        }
        
    }
}


struct ProductView: View {
    let product:Product
    let type: ProductCardType
//    if  type = .small{
//
//    }
    
    var heigt: CGFloat{
        switch type {
        case .large:
            return 100
        case .small:
            return 50
        }
    }
    
    var body: some View {
        Button(action: product.action){
            VStack(alignment: .leading){
                ZStack{
                    product.image
                        .resizable()
                        .scaledToFit()
                    VStack(spacing: 6){
                        Text(product.bonus)
                            .multilineTextAlignment(.center)
                            .frame(width: 38, height: 17)
                            .background(Rectangle().fill(Color(red: 0.35, green: 0.62, blue: 0.02)).cornerRadius(8))
                            .font(Font.system(size: 12))
                            .foregroundColor(.white)
                        if product.credit0012{
                            Text("0:0:12")
                                .multilineTextAlignment(.center)
                                .frame(width: 38, height: 17)
                                .background(Rectangle().fill(.red).cornerRadius(8))
                                .font(Font.system(size: 12))
                                .foregroundColor(.white)
                        }
                    }.position(x:16,y: 20)
                }.frame(width: 108,height: 108)
                
                Text(product.name)
                    .font(Font.system(size: 13))
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text(product.category)
                    .font(Font.system(size: 13))
                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                Text(getStringFromInt(int:product.price))
                    .font(Font.system(size: 13,weight: .bold))
                    .foregroundColor(.black)
                   
                HStack(spacing:3){
                    Text(getStringFromInt(int:product.price/6))
                        .font(Font.system(size: 12,weight: .bold))
                        .foregroundColor(.black)
                        .background(Rectangle().fill(Color(red: 1, green: 0.81, blue: 0)))
                    Text("x6")
                        .font(Font.system(size: 13))
                        .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                }
            }
        }.frame(width: 108,height: 195)
    }
}

func getStringFromInt(int:Int)->String{
    let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            formatter.groupingSeparator = " "
            let number = NSNumber(value: int)
            let formattedValue = formatter.string(from: number)!
    return formattedValue + " KZT"
}
struct Product: Identifiable {
    let id = UUID()
    let image: Image
    let name:String
    let price: Int
    let category: String
    let bonus: String
    let credit0012: Bool
    let action: ()->Void
}

var lastVisited = [
    Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: false, action: doNothing),
    Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: false, action: doNothing),
    Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: true, action: doNothing),
    Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: true, action: doNothing),
    Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: false, action: doNothing),
    Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: false, action: doNothing),
    Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: true, action: doNothing),
    Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: true, action: doNothing)
]

func doNothing()->Void{
    
}

struct rectangleSpacer:View{
    var heigth:CGFloat
    var body: some View {
        Rectangle()
            .frame(height: heigth)
            .padding(0)
            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
