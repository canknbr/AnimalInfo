//
//  MapAnnotationView.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI

struct MapAnnotationView: View {
    var location : NationalParkLocation
    @State var animation : Double = 0.0
    var body: some View {
        ZStack {
            Circle().fill(Color.accentColor)
                .frame(width: 54,height: 54)
            Circle().stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52,height: 52)
            scaleEffect(1 + CGFloat(animation))
                .opacity(1-animation)
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48,height: 48)
            .clipShape(Circle())
        }.onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
            
    }
}


