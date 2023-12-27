//
//  ProductPageView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 22.12.2023.
//

//
//  SwiftUIView.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 13.12.2023.
//

import SwiftUI
import UIKit


//let product =  Product(image: Image("iron"),name: "Pelican Strem че...", price: 50000, category: "Утюги", bonus: "5%", credit0012: true, action: doNothing)


struct ProductPageView: View {
    
    var product:Product
    
    @State private var searchText = ""
    var body: some View {
        
            ScrollView{
                
                VStack(){
                    Group {
                        Search()
                        productPhoto(product: product)
                        RectangleSpacer(heigth:2.0)
                        ProductNameView(product: product)
                        RectangleSpacer(heigth:2.0)
                        ProductPriceView(product: product)
                        RectangleSpacer(heigth:10.0)
                        BonusView()
                        RectangleSpacer(heigth:12.0)
                        CalculatorView()
                    }
                    Group {
                        RectangleSpacer(heigth:12.0)
                        DeliveryFilterView()
                        RectangleSpacer(heigth:2.0)
                        ShopListView(product: product)
                        ProceedDeliveryView()
                    }
            }.frame(width: UIScreen.main.bounds.size.width)
    }
    }
}
//struct SwiftUIView_Previews2: PreviewProvider {
//    static var previews: some View {
//        ProductPageView()
//    }
//}
