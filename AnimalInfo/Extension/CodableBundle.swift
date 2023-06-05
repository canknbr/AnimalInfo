//
//  CodableBundle.swift
//  AnimalInfo
//
//  Created by Can Kanbur on 5.06.2023.
//

import Foundation

extension Bundle {
    func decode<T:Codable>(_ file : String) -> T {
        // 1 locate json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }
        
        // 2 create property for data
        guard let data = try? Data(contentsOf: url) else{
            fatalError("failed to load \(file) from bundle")
        }
        
        // 3 create a decoder
        let decoder = JSONDecoder()
        // 4 create a property for decoded data
        
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("failed decode \(file) from bundle")
        }
        
        //  return ready-to-use data
        return loaded
    }
}
