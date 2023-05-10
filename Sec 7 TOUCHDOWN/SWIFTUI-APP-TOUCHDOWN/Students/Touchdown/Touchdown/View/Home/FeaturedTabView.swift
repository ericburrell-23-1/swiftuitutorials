//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Eric Burrell on 2/20/23.
//

import SwiftUI

struct FeaturedTabView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(player: player)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            } //: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

    // MARK: - PREVIEW
struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
            .previewDevice("iPhone 11")
            .background(Color.gray)
    }
}
