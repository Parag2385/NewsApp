//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Parag Pawar on 09/02/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var articleUrl: String?
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if articleUrl != nil {
            
            let url = URL(string: articleUrl!)
            
            guard url != nil else {
                return
            }
            
            let urlRequest = URLRequest(url: url!)
            
            spinner.alpha = 1
            spinner.startAnimating()
            
            webView.load(urlRequest)
        }
        
    }

}

extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
        spinner.alpha = 0
    }
}
