//
//  ProductModel.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 27.12.2023.
//

import Foundation
import SwiftUI


struct Product: Identifiable,Codable {
    let id = UUID()
    let image: String
    let name:String
    let price: Int
    let category: String
    let bonus: String
    let credit0012: Bool
    
}


