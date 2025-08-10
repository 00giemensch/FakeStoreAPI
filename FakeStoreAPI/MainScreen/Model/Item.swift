//
//  Item.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 09.08.2025.
//

import Foundation

struct Item: Identifiable {
    var id = UUID().uuidString
    var price: String
    var title: String
    var image: String
    
    static func mockData() -> [Item] {
        [
            Item(price: "$40", title: "Худи", image: "img1"),
            Item(price: "$10", title: "Шапка", image: "img2"),
            Item(price: "$99", title: "Куртка", image: "img3"),
            Item(price: "$40", title: "Сапоги", image: "img4"),
            Item(price: "$10", title: "Туфли", image: "img2"),
            Item(price: "$99", title: "Свитер", image: "img3"),
            Item(price: "$40", title: "Свитшот", image: "img1"),
            Item(price: "$10", title: "Очки", image: "img2"),
            Item(price: "$99", title: "Наушники", image: "img3"),
            Item(price: "$40", title: "Часы", image: "img1"),
            Item(price: "$10", title: "Кепка", image: "img2"),
            Item(price: "$99", title: "Носки", image: "img3"),
            Item(price: "$40", title: "Худи", image: "img1"),
            Item(price: "$10", title: "шапка", image: "img2"),
            Item(price: "$99", title: "куртка", image: "img3"),
            Item(price: "$40", title: "худи", image: "img1"),
            Item(price: "$10", title: "шапка", image: "img2"),
            Item(price: "$99", title: "куртка", image: "img3"),
            Item(price: "$40", title: "худи", image: "img1"),
            Item(price: "$10", title: "шапка", image: "img2"),
            Item(price: "$99", title: "куртка", image: "img3"),

        ]
    }
    
}
