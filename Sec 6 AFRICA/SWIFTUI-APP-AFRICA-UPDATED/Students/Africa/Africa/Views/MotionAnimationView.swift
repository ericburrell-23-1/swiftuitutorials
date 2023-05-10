//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Eric Burrell on 10/17/22.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    //@State private var scale: [CGFloat] = Array(repeating: 1, count: 17)
    
    // MARK: - FUNCTIONS
    
    // 1. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
//    // 6. RANDOM SPRING PROPERTIES
//    func randomSpring() -> Double {
//        return Double.random(in: 0.0...1.0)
//    }
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .animation(.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay())
                              , value: isAnimating)
                    .onAppear {
                        isAnimating = true
//                            withAnimation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
//                                .repeatForever()
//                                .speed(randomSpeed())
//                                .delay(randomDelay())) {
//                                    scale[item] = randomScale()
//                                }
                    }
                } //: LOOP
                //Text("Width: \(Int(geometry.size.width)) Height: \(Int(geometry.size.height))")
            } //: ZSTACK
            .drawingGroup()
        }
    }
}

    // MARK: - PREVIEW
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
            .previewDevice("iPhone 11")
    }
}
