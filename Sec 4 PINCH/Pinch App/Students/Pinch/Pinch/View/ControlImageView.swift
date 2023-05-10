//
//  ControlImageView.swift
//  Pinch
//
//  Created by Eric Burrell on 9/23/22.
//

import SwiftUI

struct ControlImageView: View {
    let icon:String
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(icon: "ant")
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
