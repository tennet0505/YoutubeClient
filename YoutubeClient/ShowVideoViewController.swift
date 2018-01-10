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

    @IBOutlet weak var videoWebView: WKWebView!
   
    var urlEmbed = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let urlString = "https://www.youtube.com/embed/\(urlEmbed)"
        let url = URL(string: urlString)
        let urlWeb = URLRequest(url: url!)
        
        videoWebView.load(urlWeb)
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}
