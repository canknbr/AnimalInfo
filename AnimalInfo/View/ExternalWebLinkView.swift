//
//  ExternalWebLinkView.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal : Animal
    var body: some View {
        GroupBox {
            HStack{
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }.foregroundColor(.accentColor)
            }
        }
    }
}

//struct ExternalWebLinkView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExternalWebLinkView()
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
