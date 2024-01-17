//
//  SwiftUIView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 13.12.2023.
//

import SwiftUI

struct SwiftUIView: View {
    
    @ObservedObject var viewModel:ProductViewModel
    
    var presentProductDetails: (Product)->Void
    
    @State private var searchText = ""
    var body: some View {
        
            ScrollView{
                VStack(){
                    Search()
                    advertisments
                    RectangleSpacer(heigth: 12.0)
                    gridBody
                    RectangleSpacer(heigth: 2.0)
                    kaspiOffers
                    RectangleSpacer(heigth: 12.0)
                    LastVisitedView(viewModel:viewModel,presentProductDetails: presentProductDetails)
                    RectangleSpacer(heigth: 12.0)
                    RecView(viewModel:viewModel, presentProductDetails: presentProductDetails)
                }.frame(width: UIScreen.main.bounds.size.width)
            }
        
    }
    
    var kaspiOffers: some View{
        
        let offers = [Offer(title: "Рассрочка 0-0-12"),
                     Offer(title: "Kaspi Red",subTitle: "Рассрочка 0%" ),
                      Offer(title: "Кредиты",subTitle: "до 1 миллиона" ),
                       Offer(title: "Kaspi Депозит",subTitle: "Эффектиные" ),
                      Offer(title: "Кредит На Покупки",subTitle: "Кредит или рассрочка 0%" )

        ]
        
        return ScrollView(.horizontal,showsIndicators: false){
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
    
    var advertisments: some View{
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing: 12){
                Spacer()
                AdView(ad: Ad(image: Image("ad"), date: "12-13 december"))
                AdView(ad: Ad(image: Image("ad"), date: "14-15 december"))
                AdView(ad: Ad(image: Image("ad"), date: "12-13 december"))
                AdView(ad: Ad(image: Image("ad"), date: "12-13 december"))
                AdView(ad: Ad(image: Image("ad"), date: "12-13 december"))
            }
        }
    }
}

func doNothing()->Void{
}

struct Search:View{
    var body: some View {
        Button(action: doNothing){
            ZStack(alignment: .leading){
                Rectangle()
                    .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
                    .frame(width: 354,height: 36)
                    .cornerRadius(8)
                HStack{
                    Image("searchGray")
                        .frame(width:24,height: 24)
                    Text("Поиск по Kaspi.kz")
                        .font(Font.system(size: 15))
                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                }.padding(.horizontal,8)
            }
        }
    }
}


struct RectangleSpacer:View{
    var heigth:CGFloat
    var body: some View {
        Rectangle()
            .frame(height: heigth)
            .padding(0)
            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
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


