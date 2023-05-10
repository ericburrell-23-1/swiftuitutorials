//
//  PageModel.swift
//  Pinch
//
//  Created by Eric Burrell on 9/27/22.
//

import Foundation

struct Page: Identifiable {
    let id:Int
    let imageName:String
}

extension Page {
    var thumbnailName:String {
        return "thumb-" + imageName
    }
}
