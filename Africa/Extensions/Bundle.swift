//
//  Bundle.swift
//  Africa
//
//  Created by Muhammad Usman on 14/09/2021.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ fileName: String) -> T {
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            fatalError("File not found with name \(fileName)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Erorr")
        }
        
        guard let loaded = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Error")
        }
        
        return loaded
    }
}
