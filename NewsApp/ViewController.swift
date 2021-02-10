//
//  ViewController.swift
//  NewsApp
//
//  Created by Parag Pawar on 08/02/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let model = ArticleModel()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        model.delegate = self
        model.getArticles()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow
        
        guard indexPath != nil else {
            return
        }
        
        let article = articles[indexPath!.row]
        
        let detailView = segue.destination as! DetailViewController
    
        detailView.articleUrl = article.url
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        cell.displayArticle(articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
}

extension ViewController: ArticleModelProtocol{
    
    func onReceivedArticle(_ articles: [Article]) {
        self.articles = articles
        
        tableView.reloadData()
    }
    
}

