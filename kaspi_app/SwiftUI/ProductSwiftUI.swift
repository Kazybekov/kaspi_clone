//
//  ProductSwiftUI.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 22.12.2023.
//

import SwiftUI


enum ProductCardType{
    case large
    case small
}

struct LastVisitedView: View{
    var lastVisited = [
        Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: false, action: doNothing),
        Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: false, action: doNothing),
        Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: true, action: doNothing),
        Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: true, action: doNothing),
        Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: false, action: doNothing),
       ]
    
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
            Text("Все предложения")
            .font(Font.system(size: 18,weight: .bold))
            .foregroundColor(Color(red: 0.2, green: 0.61, blue: 0.9))
            .padding(.horizontal)
        }
    }
}

struct RecView: View{
    var lastVisited = [
        Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: false, action: doNothing),
        Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: false, action: doNothing),
        Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: true, action: doNothing),
        Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: true, action: doNothing),
        Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: false, action: doNothing),
       ]
    
    var body: some View{
        VStack(alignment: .leading){
            
            Text("Вас могут заинтересовать")
                .font(Font.system(size: 18,weight: .bold))
            HStack{
                VStack{
                    ProductView(product: lastVisited[0],type:.large)
                    ProductView(product: lastVisited[3],type:.large)
                }
                
                VStack{
                    ProductView(product: lastVisited[3],type:.large)
                    ProductView(product: lastVisited[1],type:.large)
                    
                }
            }
        }
    }
}


struct ProductView: View {
    let product:Product
    let type: ProductCardType
    var heigt: CGFloat{
        switch type {
        case .large:
            return 233
        case .small:
            return 195
        }
    }
    var width: CGFloat{
        switch type {
        case .large:
            return UIScreen.main.bounds.size.width/2-31
        case .small:
            return 108
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
                }
            
                Text(product.name)
                    .font(Font.system(size: 13))
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text(product.category)
                    .font(Font.system(size: 13))
                    .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                
                switch type {
                case .large:
                    HStack{
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
                    }.scaledToFill()

                case .small:
                    
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
                
                
                
            }
        }.frame(width: self.width,height: self.heigt)
    }
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
