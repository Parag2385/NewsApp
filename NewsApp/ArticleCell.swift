//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Parag Pawar on 09/02/21.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UILabel!
    
    @IBOutlet weak var articleImage: UIImageView!
    
    var articleToDisplay: Article?
    
    func displayArticle(_ article: Article) {
        
        articleImage.image = nil
        articleImage.alpha = 0
        articleToDisplay = article
        headlineLabel.alpha = 0
        
        headlineLabel.text = articleToDisplay?.title
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.headlineLabel.alpha = 1
        }, completion: nil)
        
        let urlString = article.urlToImage
        
        guard urlString != nil else {
            return
        }
        
        if let imageData = CacheManager.retrieveData(url: urlString!){
            DispatchQueue.main.async {
                self.articleImage.image = UIImage(data: imageData)
                UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                    self.articleImage.alpha = 1
                }, completion: nil)
            }
            return
        }
        
        let url = URL(string: urlString!)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                CacheManager.saveData(url: urlString!, imageData: data!)
                
                if self.articleToDisplay!.urlToImage == urlString {
                    DispatchQueue.main.async {
                        self.articleImage.image = UIImage(data: data!)
                        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
                            self.articleImage.alpha = 1
                        }, completion: nil)
                    }
                }
                
            }
            
        }
        
        dataTask.resume()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
