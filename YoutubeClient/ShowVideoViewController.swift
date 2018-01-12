//
//  ShowVideoViewController.swift
//  YoutubeClient
//
//  Created by Admin on 09.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit
import RealmSwift


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
        
        addVideo()
    
        
    }
    
    func addVideo(){
        
        let video1 = VideoFavorite()
   
        video1.imageFav = imageItemString
        video1.titleFav = titleItemString
      //  video1.videoURLFav = urlEmbed
        
        let realm =  try! Realm()
        
        try! realm.write {
        
            realm.add(video1)

            
            print ("Add \(video1)")
        }
        
    }
    
    
    
//    func updateVideo(){
//
//        let realm = try! Realm()
//        let allVideo = realm.objects(VideoFavorite.self)
//
//        for video in allVideo{
//            print("Add video \(video.imageFav) of \(video.titleFav)")
//        }
//
//
//    }
  
    
    
    
    
    
}
