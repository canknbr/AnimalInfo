//
//  ContentView.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 2.06.2023.
//

import SwiftUI

struct ContentView: View {
    let animals : [Animal] = Bundle.main.decode("animals.json")
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    
                    NavigationLink {
                        AnimalDetailView(animal: animal)
                    } label: {
                        AnimalListItemView(animal: animal)
                    }

                }.padding(-10)
                    .padding(.top,20)
                
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
