//
//  ShowVideoViewController.swift
//  YoutubeClient
//
//  Created by Admin on 09.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit


class ShowVideoViewController: UIViewController {

    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var videoWebView: WKWebView!
   
    var urlEmbed = ""

    var imageItemString = ""
    var titleItemString = ""
    
    var favorite = FavoriteTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

        let urlString = "https://www.youtube.com/embed/\(urlEmbed)"
        let url = URL(string: urlString)
        let urlWeb = URLRequest(url: url!)
        
        videoWebView.load(urlWeb)

        
    }
    
    func WebViewDidStartLoad (videoWebView :WKWebView){
        loadIndicator.startAnimating()
    }
    func WebViewDidFinishedLoad (videoWebView :WKWebView){
        loadIndicator.stopAnimating()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func likeButton(_ sender: Any) {
        
        
   //     favorite.favImage = imageItemString
        favorite.favItem = titleItemString
        
    }
    
  
    
    
    
    
    
}
