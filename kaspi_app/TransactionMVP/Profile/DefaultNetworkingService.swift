//
//  RandomButtonExtension.swift
//  kaspi_app
//
//  Created by Yersin Kazybekov on 06.11.2023.
//

import Foundation
import UIKit

protocol NetworkingService{
    
    var delegate : ProfileViewController? { get set }
    
    func loadRandomPhoto(completion: @escaping ((Data?, Error?)->Void))
}

class DefaultNetworkingService:NetworkingService {
    
    weak var delegate: ProfileViewController?

    private let urlString = "https://api.unsplash.com/photos/random/?client_id=ImW3xbP7qPLWqI1RPbBtxoyWaNIo82LH7WDPIDf2my8"
    
    func loadRandomPhoto(completion: @escaping ((Data?, Error?) -> Void)) {
        fetchData(urlString)
    }
    
    private func fetchImage(_ url:String) {
        let url=URL(string: url)
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil{
                print (error!)
                return
            }
            guard let json=data else { return }
            DispatchQueue.main.async {
                let image = UIImage(data: json)
                self.delegate?.updateAvatar(image: image)
            }
        }
        task.resume()
    }
    
    private func fetchData(_ url:String) {
        let url=URL(string: url)
        let session=URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil{
                print (error!)
                return
            }
            guard let json=data,
                  let safeImageURLString = self.parseJsonForImageUrl(json) else { return }
            DispatchQueue.main.async {
                self.fetchImage(safeImageURLString)
            }
        }
        task.resume()
    }
    
    
    private func parseJsonForImageUrl(_ json:Data)->String?{
        let decoder=JSONDecoder()
        do{
            let parsedData = try decoder.decode(imageData.self, from: json)
            return parsedData.urls.regular
        }
        catch{
            print(error)
            return nil
        }
    }
}

struct imageData:Decodable{
    var urls:URL
    struct URL:Decodable{
         var regular:String
    }
}
