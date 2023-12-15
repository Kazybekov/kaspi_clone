//
//  SwiftUIView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 13.12.2023.
//

import SwiftUI
//import UIKit


struct SwiftUIView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(){
                    
                    advertisments
                    rectangleSpacer(heigth: 12.0)
                    Spacer()
                    gridBody
                }.searchable(text: $searchText)
                    .navigationBarTitle("", displayMode: .inline)
                    
                                
                    
            }
            
        }
           
                
//        ,placement: .navigationBarDrawer(displayMode: .always),prompt: "Поиск по Kaspi.kz"
        
        
            
            
        
        
            
            
    }
}

let layout = [
        GridItem(.fixed(74)),
        GridItem(.fixed(74))]

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
func doNothing()->Void{
    
}
struct buttonInfo:Identifiable{
    let id=UUID()
    let text:String
    let icon:Image
}

var gridBody: some View {
        LazyHGrid(rows: layout, spacing: 20) {
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

struct rectangleSpacer:View{
    
    var heigth:CGFloat
    
    var body: some View {
        Rectangle()
            .frame(height: heigth)
            .padding(0)
            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.95))
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
struct Ad: Identifiable {

    let id = UUID()
    var image:Image
    var date:String
}
struct AdView: View{
    let ad: Ad
    var body: some View {
        VStack(alignment: .leading){
            ad.image
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                
            Text(ad.date)
                .font(Font.custom("Roboto", size: 12))
                .foregroundColor(Color(red: 0.64, green: 0.64, blue: 0.64))
                
                
        }.frame(width: 165,height: 126)
            
            
    }
}
struct Seacrh: View {
    @State private var searchText = ""

    var body: some View {
            NavigationStack {
            }
            .searchable(text: $searchText, prompt: "Поиск по Kaspi.kz")
            
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
