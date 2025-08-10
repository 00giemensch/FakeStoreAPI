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
    
    func sendRequest() {
        let urlString = "https://fakestoreapi.com/products"
        url = URL(string: urlString)
        request = URLRequest(url: url!)
        print("URL: \(url)")
        
        URLSession.shared.dataTask(with: request!) { data, response, err in
            guard err == nil else {
                print(err!.localizedDescription)
                return
            }
            print(response)
            print(data)
        }.resume()
    }
}
