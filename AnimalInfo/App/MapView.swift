//
//  MapView.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 2.06.2023.
//

import MapKit
import SwiftUI

struct MapView: View {
    @State var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        var mapType = MKMapType.satellite

        return mapRegion
    }()

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            MapAnnotation(coordinate: item.locations) {
                Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 38, height: 38)
            }

        })
        .overlay(
            HStack(alignment: .center, spacing: 12, content: {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 38)
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.orange.opacity(0.6))
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .bold()
                            .foregroundColor(.orange.opacity(0.6))
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            })
            .padding(.vertical, 12)
            .padding(.horizontal, 15)
            .background(
                Color.black.opacity(0.6)
                    .cornerRadius(20)
            )
            .padding(), alignment: .top
        )
        .onAppear {
            MKMapView.appearance().mapType = .satelliteFlyover
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
