//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Parag Pawar on 08/02/21.
//

import Foundation

protocol ArticleModelProtocol {
    func onReceivedArticle(_ articles: [Article])
}

class ArticleModel {
    
    var delegate: ArticleModelProtocol?
    
    func getArticles() {
        
        let pathString = "https://newsapi.org/v2/everything?q=tesla&from=2021-01-09&sortBy=publishedAt&apiKey=API_KEY"
        
        let url = URL(string: pathString)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                
                do{
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.delegate?.onReceivedArticle(articleService.articles ?? [Article]())
                    }
                    
                }catch{
                    print(error)
                }
                
            }
        }
        
        dataTask.resume()
    }
    
}
