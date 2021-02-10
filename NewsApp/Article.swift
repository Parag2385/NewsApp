//
//  Article.swift
//  NewsApp
//
//  Created by Parag Pawar on 08/02/21.
// b7a9183c6c1c4001b854265a3c81a049

import Foundation

struct Article: Decodable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
