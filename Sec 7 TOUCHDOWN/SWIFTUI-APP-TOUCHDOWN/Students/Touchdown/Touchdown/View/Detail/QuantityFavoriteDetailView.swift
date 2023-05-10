//
//  QuantityFavoriteDetailView.swift
//  Touchdown
//
//  Created by Eric Burrell on 2/21/23.
//

import SwiftUI

struct QuantityFavoriteDetailView: View {
    // MARK: - PROPERTIES

    @State private var counter: Int = 0
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Button(action: {
                if counter > 0 {
                    feedback.impactOccurred()
                    counter -= 1
                }
            }) {
                Image(systemName: "minus.circle")
            } //: BUTTON
            
            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)
            
            Button(action: {
                feedback.impactOccurred()
                counter += 1
            }) {
                Image(systemName: "plus.circle")
            } //: BUTTON
            
            Spacer()
            
            Button(action: {
                feedback.impactOccurred()
            }) {
                Image(systemName: "heart.circle")
                    .foregroundColor(.pink)
            } //: BUTTON
        } //: HSTACK
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

    // MARK: - PREVIEW
struct QuantityFavoriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityFavoriteDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
