//
//  Base.swift
//  CoreDataFundamentals
//
//  Created by Abhishek Bagela on 02/04/22.
//

import Foundation

protocol BaseFruits {
    func getFruits()
    //    func getFruit()
    func addFruit(_ fruit: Fruit)
    //    func updateFruit()
    func deleteFruit(_ fruit: FruitsEntity)
}
