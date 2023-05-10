//
//  CenterModifier.swift
//  Africa
//
//  Created by Eric Burrell on 10/21/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
