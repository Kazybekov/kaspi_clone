//
//  SecondNetworkingService.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 11.11.2023.
//

import Foundation


class SecondNetworkingService: NetworkingService{
    
    weak var delegate: ProfileViewController?
    
    private let urlString = "https://api.unsplash.com/photos/random/?client_id=ImW3xbP7qPLWqI1RPbBtxoyWaNIo82LH7WDPIDf2my8"
    
    
    func loadRandomPhoto(completion: @escaping ((Data?, Error?) -> Void)) {
        let url=URL(string: urlString)
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil{
                print (error!)
                return
            }
            guard let safeData = data,
                  let url = self.parseJsonForImageUrl(safeData) else{return completion(nil,nil)}
            
            self.loadImage(url) {data, error in
                completion(data,error)
            }
                  
        }
        task.resume()
    }
    
    func loadImage(_ urlImage:String,completion: @escaping ((Data?, Error?) -> Void)) {
        
        let newUrl = URL(string: urlImage)
       
        let session2=URLSession(configuration: .default)
        let task2 = session2.dataTask(with: newUrl!) { data, response, error in
            if error != nil{
                print (error!)
                completion(nil,error)
            }
            if let safeData=data {
                completion(safeData,nil)
            }else { completion(nil,nil) }
        }
        task2.resume()
    }
    
    private func parseJsonForImageUrl(_ json:Data)->String?{
        let decoder=JSONDecoder()
        do{
            let parsedData = try decoder.decode(Image.self, from: json)
            return parsedData.urls.regular
        }
        catch{
            print(error)
            return nil
        }
    }
    
    
}
