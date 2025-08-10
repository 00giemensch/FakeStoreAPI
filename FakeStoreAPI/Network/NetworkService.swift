//
//  NetworkService.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 10.08.2025.
//

import Foundation

class NetworkService {
    var url: URL?
    var request: URLRequest?
    
    func sendRequest(completion: @escaping ([StoreItem]) -> Void) {
        let urlString = "https://fakestoreapi.com/products"
        url = URL(string: urlString)
        request = URLRequest(url: url!)
        print("URL: \(url)")
        
        URLSession.shared.dataTask(with: request!) { data, response, err in
            guard err == nil else {
                print(err!.localizedDescription)
                completion([])
                return
            }
            if let jsonData = data {
                do {
                    let storeResponse = try JSONDecoder().decode([StoreItem].self, from: jsonData)
                    completion(storeResponse)
                    print(storeResponse[2].title) // Mens Cotton Jacket
                    print(storeResponse[2].price) // 55.99
                    print(storeResponse[2].image) // https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_t.png
                } catch {
                    print(error.localizedDescription)
                    completion([])
                }
            }
        }.resume()
    }
}


