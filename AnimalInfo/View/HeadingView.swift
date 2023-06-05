//
//  HeadingView.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI

struct HeadingView: View {
    var headingImage: String
    var headingText : String
    var body: some View {
        HStack{
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .bold()
        }
    }
}

//struct HeadingView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeadingView()
//    }
//}
