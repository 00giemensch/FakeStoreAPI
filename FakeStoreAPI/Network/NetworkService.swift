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
                } catch {
                    print(error.localizedDescription)
                    completion([])
                }
            }
        }.resume()
    }
}


