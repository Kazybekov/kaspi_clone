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
        
            ScrollView{
                VStack(){
                    Search()
        
                    advertisments
                    rectangleSpacer(heigth: 12.0)
                    gridBody
                    rectangleSpacer(heigth: 2.0)
                    kaspiOffers
                    rectangleSpacer(heigth: 12.0)
                    LastVisitedView()
                    rectangleSpacer(heigth: 12.0)
                    RecView()
                }.frame(width: UIScreen.main.bounds.size.width)
            }
//
//            .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always), prompt:"Поиск по Kaspi.kz")
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationTitle("Kaspi")
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

func getStringFromInt(int:Int)->String{
    let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            formatter.groupingSeparator = " "
            let number = NSNumber(value: int)
            let formattedValue = formatter.string(from: number)!
    return formattedValue + " KZT"
}

extension View {
    
    func injectIn(controller vc: UIViewController) {
        let controller = UIHostingController(rootView: self)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.backgroundColor = .clear
        vc.view.addSubview(controller.view)
        
        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
            controller.view.topAnchor.constraint(equalTo: vc.view.topAnchor),
            controller.view.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor),
            controller.view.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor)
        ])
    }
    
}
