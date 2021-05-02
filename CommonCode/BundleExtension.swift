//
//  BundleExtension.swift
//  CommonCode
//
//  Created by Charles Eison on 4/30/21.
//

import Foundation

extension Bundle {
    
    /// Extends Bundle to easily decode any given json data
    /// - parameter file: File to be decoded, must be .json file type
    func decode<T: Codable>(_ file: String) -> T {
        
        //capturing our file url (location). withExtension is nil because we will be passing in cards.json, not cards with no extension, so no need to explicitly declare our extension.
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        //capturing the contents of our file in a variable. Data is our datatype, same as String(contentsOf) where String is our data type.
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        //creating an instance of JSONDecoder
        let decoder = JSONDecoder()
        
        //decoding our data using T.self (T is our placeholder type) and setting to a variable we can return
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        //returning our data
        return loaded
        
    }
}
