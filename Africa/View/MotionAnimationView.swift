//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Muhammad Usman on 15/09/2021.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircles : Int = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // 1: Random coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // 2: Random size
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    
    // 3: Random scale
    func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1...2.0)
    }
    
    // 4: Random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1)
    }
    
    // Randelayom 
    
    var body: some View {
        GeometryReader{ geometry in
            ForEach(0...randomCircles, id: \.self) { item in
                Circle()
                    .foregroundColor(.gray)
                    .opacity(0.15)
                    .frame(width: randomSize(), height: randomSize(), alignment: .center)
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .position(
                        x: randomCoordinate(max: geometry.size.width),
                        y: randomCoordinate(max: geometry.size.height)
                )
                    .animation(
                        Animation
                            .interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                             .delay(1)
                    )
                    .onAppear(perform: {
                        isAnimating = true
                    })
            }
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
