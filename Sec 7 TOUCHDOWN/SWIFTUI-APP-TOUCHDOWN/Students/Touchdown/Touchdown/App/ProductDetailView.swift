//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Eric Burrell on 10/31/22.
//

import SwiftUI

struct ProductDetailView: View {
    // MARK: - PROPERTIES
    
    @EnvironmentObject var shop: Shop

    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // MARK: - NAVBAR
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, topSafeAreaPaddingLength)
            
            // MARK: - HEADER
            HeaderDetailView()
                .padding(.horizontal)
            
            // MARK: - DETAIL TOP PART
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1)
            
            // MARK: - DETAIL BOTTOM PART
            VStack(alignment: .center, spacing: 0) {
                // MARK: - RATINGS + SIZES
                RatingsSizesDetailView()
                    .padding(.top, -25)
                    .padding(.bottom, 10)
                
                // MARK: - DESCRIPTION
                ScrollView(.vertical, showsIndicators: false) {
                    Text(shop.selectedProduct?.description ?? sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                } //: SCROLL
                // MARK: - QUANTITY + FAVORITE
                QuantityFavoriteDetailView()
                    .padding(.vertical, 10)
            
                // MARK: - ADD TO CART
                AddToCartDetailView()
                    .padding(.bottom, 20)
            } //: VSTACK
            .padding(.horizontal)
            .background(
                Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -105)
            )
            
        } //: VSTACK
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(
                red: shop.selectedProduct?.red ?? sampleProduct.red,
                green: shop.selectedProduct?.green ?? sampleProduct.green,
                blue: shop.selectedProduct?.blue ?? sampleProduct.blue)
            .ignoresSafeArea(.all, edges: .all)
        )
    }
}

    // MARK: - PREVIEW
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
            .previewLayout(.fixed(width: 375, height: 812))
    }
}
