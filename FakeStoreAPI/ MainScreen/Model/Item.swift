//
//  Item.swift
//  FakeStoreAPI
//
//  Created by Ilnur on 09.08.2025.
//

import Foundation

struct Item: Identifiable {
    var id = UUID().uuidString
//    var price: String
    var title: String
    var image: String
    
    static func mockData() -> [Item] {
        [
            Item(title: "худи", image: "img1"),
            Item(title: "блок сигарет", image: "img2"),
            Item(title: "зажигалка", image: "img3"),
            Item(title: "сендвич", image: "img4"),
            Item(title: "сендвич", image: "img4"),
            Item(title: "сендвич", image: "img4"),
        ]
    }
    
//    static func mockData() -> [Item] {
//        [
//            Item(price: "$500", title: "худи", image: "img1"),
//            Item(price: "$100", title: "блок сигарет", image: "img2"),
//            Item(price: "$23", title: "зажигалка", image: "img3"),
//            Item(price: "4", title: "сендвич", image: "img4"),
//        ]
//    }
}
