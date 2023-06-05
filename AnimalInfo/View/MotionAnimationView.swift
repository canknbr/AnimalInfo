//
//  MotionAnimationView.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI

struct MotionAnimationView: View {
    @State var randomCircle : Int = Int.random(in: 12...16)
    @State var isAnimating = false
    func randomCoordinate(max:CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    func randomSize()->CGFloat {
        return CGFloat.random(in: 10...300)
    }
    func randomScale()->CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    func randomSpeed()->Double {
        return Double.random(in: 0.025...1)
    }
    func randomDelay()->Double{
        return Double.random(in: 0.1...1.4)
    }
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                ForEach(0...randomCircle,id:\.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(),height: randomSize())
                        .scaleEffect(isAnimating ? randomScale() : 1 )
                        .position(x: randomCoordinate(max: geometry.size.width) , y: randomCoordinate(max: geometry.size.height))
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever().speed(randomSpeed()).delay(randomDelay()), value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                }
            }
            .drawingGroup()
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
