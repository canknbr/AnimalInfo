//
//  InsetFactView.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI

struct InsetFactView: View {
    let animal : Animal
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact,id:\.self) { item in
                    Text(item)
                }
            }.tabViewStyle(PageTabViewStyle())
                .frame(minHeight: 148,idealHeight: 168,maxHeight: 180)
                .cornerRadius(20)
        }
    }
}

//struct InsetFactView_Previews: PreviewProvider {
//    static var previews: some View {
//        InsetFactView()
//    }
//}
