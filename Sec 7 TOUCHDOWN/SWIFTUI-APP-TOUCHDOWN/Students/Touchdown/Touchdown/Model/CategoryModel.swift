//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Eric Burrell on 2/20/23.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
