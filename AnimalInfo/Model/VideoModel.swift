//
//  VideoModel.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 5.06.2023.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    var videoImage: String {
        return "video-\(id)"
    }
}
