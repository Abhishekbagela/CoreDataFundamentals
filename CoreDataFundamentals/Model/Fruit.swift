//
//  Fruit.swift
//  CoreDataFundamentals
//
//  Created by Abhishek Bagela on 02/04/22.
//

import Foundation


class Fruit {
    var name: String? = nil
    var price: Int64? = nil
    
    init(_ name: String, _ price: Int64) {
        self.name = name
        self.price = price
    }
}
