//
//  CacheManager.swift
//  NewsApp
//
//  Created by Parag Pawar on 09/02/21.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData(url: String, imageData: Data){
        imageDictionary[url] = imageData
    }
    
    static func retrieveData(url: String) -> Data? {
        return imageDictionary[url]
    }
    
}
