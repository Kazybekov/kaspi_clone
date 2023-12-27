//
//  ProductViewModel.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 27.12.2023.
//

import Foundation
import SwiftUI


class ProductViewModel: ObservableObject {
    
    func printLine(fileName:String) -> String {
        var result = ""
        do {
              if let bundlePath = Bundle.main.path(forResource: fileName, ofType: nil) {
                 let stringContent = try String(contentsOfFile: bundlePath)
                  result = stringContent
              }
           } catch {
              print(error)
           }
        return result
    }
    
    var lastVisited:[Product] {
        do {
            if let jsonData = printLine(fileName:"LastVisited.txt").data(using: .utf8) {
                let decoder = JSONDecoder()
                let products = try decoder.decode([Product].self, from: jsonData)
                return products
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
        
        return [
            Product(image:"iron",name: "Pelican Strem че...", price: 200, category: "Утюги", bonus: "5%", credit0012: false),
            ]
        
    }
    
    var recs:[Product] {
        do {
            if let jsonData = printLine(fileName: "Recs.txt").data(using: .utf8) {
                let decoder = JSONDecoder()
                let products = try decoder.decode([Product].self, from: jsonData)
                return products
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
        
        return [
            Product(image:"iron",name: "Pelican Strem че...", price: 200, category: "Утюги", bonus: "5%", credit0012: false),
            ]
        
    }
}
