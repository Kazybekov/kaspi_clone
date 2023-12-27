//
//  AdvertismentSwiftUI.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 19.12.2023.
//

import Foundation
import SwiftUI

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
