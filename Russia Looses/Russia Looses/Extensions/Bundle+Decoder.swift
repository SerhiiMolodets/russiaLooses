//
//  Bundle+Decoder.swift
//  Russia Looses
//
//  Created by Serhii Molodets on 24.08.2023.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable>(file: String) -> [T] {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project!")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could get data from url!")
        }
        
        let decoder = JSONDecoder()
        var load: [T] = []
        do {
            load = try decoder.decode([T].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
        return load
    }
}
