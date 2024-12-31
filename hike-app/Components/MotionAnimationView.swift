//
//  MotionAnimationView.swift
//  hike-app
//
//  Created by k21047kk on 2024/12/31.
//

import SwiftUI

struct MotionAnimationView: View {
    let frameSize: CGFloat = 256
    
    // MARK: - PROPERTIES
    @State private var randomCircle:Int  = Int.random(in: 6...12)
    @State private var isAnimating: Bool =  false
    
    // MARK: - FUNCTION
    
    // 1. RANDOM COORDINATE
    func ramdomCoordinate() -> CGFloat {
        return CGFloat.random(in: 0...frameSize)
    }
    // 2. RANDOM SIZE
    func ramdomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    // 3. RANDOM SCALE
    func ramdomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. RANDOM SPEED
    func ramdomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    // 5. RANDOM DELAY
    func ramdomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(
                        width: ramdomSize(),
                        height: ramdomSize()
                    )
                    .position(
                        x: ramdomCoordinate(),
                        y: ramdomCoordinate()
                    )
                    .scaleEffect(isAnimating ? ramdomScale() : 1)
                    .onAppear {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(ramdomSpeed())
                            .delay(ramdomDelay())
                        ){
                            isAnimating = true
                        }
                    }
                
            }
        } //: ZStack
        .frame(width: frameSize, height: frameSize)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    
    MotionAnimationView().background(
        Circle()
        .fill(.teal)
    )

}
