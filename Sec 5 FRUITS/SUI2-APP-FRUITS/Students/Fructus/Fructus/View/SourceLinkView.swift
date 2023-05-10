//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Eric Burrell on 10/1/22.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        GroupBox {
            HStack {
                Text("Content Source:")
                
                Spacer()
                
                Link(destination: URL(string: "https://wikipedia.com")!) {
                    Text("Wikipedia")
                    Image(systemName: "arrow.up.right.square")
                }
            }
        }
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
