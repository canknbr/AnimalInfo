//
//  InsetMapView.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 5.06.2023.
//

import MapKit
import SwiftUI

struct InsetMapView: View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(destination: MapView(), label: {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .bold()
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(10)
                    )
                }
                              ).padding(12),alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(20)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
