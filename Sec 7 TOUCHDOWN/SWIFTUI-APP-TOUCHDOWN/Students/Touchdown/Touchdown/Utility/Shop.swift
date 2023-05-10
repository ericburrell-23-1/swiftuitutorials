//
//  Shop.swift
//  Touchdown
//
//  Created by Eric Burrell on 2/21/23.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectedProduct: Product? = nil
}
