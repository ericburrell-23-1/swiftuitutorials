//
//  VideoModel.swift
//  Africa
//
//  Created by Eric Burrell on 10/12/22.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
