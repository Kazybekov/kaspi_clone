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
    
    @ObservedObject var viewModel:ProductViewModel
    
    var presentProductDetails: (Product)->Void
    
    var body: some View{
        VStack(alignment: .leading){
            
            Text("Вы недавно смотрели")
                .font(Font.system(size: 18,weight: .bold))
                .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 18){
                    ForEach(viewModel.lastVisited) { visit in
                            ProductView(presentProductDetails: presentProductDetails,product: visit,type:.small)
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
    
    @ObservedObject var viewModel:ProductViewModel
    
    var presentProductDetails: (Product)->Void
    
    
    
    var body: some View{
        VStack(alignment: .leading){
            
            Text("Вас могут заинтересовать")
                .font(Font.system(size: 18,weight: .bold))
            HStack{
                VStack{
                    ProductView(presentProductDetails: presentProductDetails, product: viewModel.recs[0],type:.large)
                    ProductView(presentProductDetails: presentProductDetails,product: viewModel.recs[1],type:.large)
                }
                
                VStack{
                    ProductView(presentProductDetails: presentProductDetails,product: viewModel.recs[2],type:.large)
                    ProductView(presentProductDetails: presentProductDetails,product: viewModel.recs[3],type:.large)
                    
                }
            }
        }
    }
}


struct ProductView: View {
    
    var presentProductDetails: (Product)->Void
    
    let product:Product
    let type: ProductCardType
    var heigt: CGFloat{
        return (type == .large) ? 233 : 195
    }
    
    var width: CGFloat{
        return (type == .large) ? UIScreen.main.bounds.size.width/2-31 : 108
    }
    
    var body: some View {
        Button(action: {
            presentProductDetails(product)
        }){
            VStack(alignment: .leading){
                ZStack{
                    Image(product.image)
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
                        ProductPrice(int: product.price)
                           
                        ProductPriceBySix(int: product.price)
                    }.scaledToFill()

                case .small:
                    
                    ProductPrice(int: product.price)
                       
                    ProductPriceBySix(int: product.price)

                }
                
                
                
            }
        }.frame(width: self.width,height: self.heigt)
    }
}
struct ProductPriceBySix:View{
    
    let int: Int
    
    var body: some View{
        HStack(spacing:3){
            Text(getStringFromInt(int:int/6))
                .font(Font.system(size: 12,weight: .bold))
                .foregroundColor(.black)
                .background(Rectangle().fill(Color(red: 1, green: 0.81, blue: 0)))
            Text("x6")
                .font(Font.system(size: 13))
                .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
        }

        
    }
    
}

struct ProductPrice:View{
    
    let int: Int
    
    var body: some View{
        Text(getStringFromInt(int:int))
            .font(Font.system(size: 13,weight: .bold))
            .foregroundColor(.black)
        
    }
    
}

