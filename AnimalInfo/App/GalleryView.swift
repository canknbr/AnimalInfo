//
//  GalleryView.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 2.06.2023.
//

import SwiftUI

struct GalleryView: View {
    @State var selectedAnimals = "lion"
    @State private var gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumnn : Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumnn))
    }
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
//    let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    var body: some View {
        ScrollView(Axis.Set.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimals)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(.white, lineWidth: 4)
                    )
                Slider(value: $gridColumnn, in: 2...4,step: 1)
                    .padding()
                    .onChange(of: gridColumnn) { newValue in
                        withAnimation {
                            gridSwitch()
                        }
                    }
                LazyVGrid(columns: gridLayout) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 2)
                            )
                            .onTapGesture {
                                withAnimation {
                                    selectedAnimals = item.image
                                }
                            }
                    }
                }
                .onAppear {
                    gridSwitch()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
