//
//  FavoritePlayerViewController.swift
//  YoutubeClient
//
//  Created by Admin on 12.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit

class FavoritePlayerViewController: UIViewController {

    @IBOutlet weak var WebPlayer: WKWebView!
    var webPlayer = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "https://www.youtube.com/embed/\(webPlayer)"
        let url = URL(string: urlString)
        let urlWeb = URLRequest(url: url!)
        
        WebPlayer.load(urlWeb)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}
