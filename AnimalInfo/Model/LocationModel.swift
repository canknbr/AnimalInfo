//
//  LocationModel.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 5.06.2023.
//

import Foundation
import MapKit
struct NationalParkLocation : Codable,Identifiable {
    var id : String
    var name : String
    var image : String
    var latitude : Double
    var longitude : Double
    
    var locations : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
