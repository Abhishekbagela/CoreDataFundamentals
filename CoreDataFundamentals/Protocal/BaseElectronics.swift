//
//  BaseElectronics.swift
//  CoreDataFundamentals
//
//  Created by Abhishek Bagela on 02/04/22.
//

import Foundation


protocol BaseElectronics {
    func getProducts()
    func addProduct(_ product: Product)
    func deleteProduct(_ product: ProductEntity)
}
