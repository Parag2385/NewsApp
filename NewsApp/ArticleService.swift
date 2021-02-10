//
//  ArticleService.swift
//  NewsApp
//
//  Created by Parag Pawar on 08/02/21.
//

import Foundation

struct ArticleService: Decodable {
    var totalResults: Int?
    var articles: [Article]?
}
