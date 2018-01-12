//
//  FavoriteTableViewController.swift
//  YoutubeClient
//
//  Created by Admin on 11.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import RealmSwift
import AlamofireImage

class FavoriteTableViewController: UITableViewController {

    var favoriteVideoImageArray = [String]()
    var favoriteVideoTitleArray = [String]()
    var favoriteVideoURLArray = [String]()

    var favItem = ""
    
  
    let realm = try! Realm()

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
       
        updateVideo()
        
        print(favoriteVideoTitleArray)
        

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        subscribeModelChanges()
    }
    override func viewDidDisappear(_ animated: Bool) {
        unSubscribeModelChanges()
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteVideoImageArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        as! FavoriteTableViewCell

        cell.favorieLabel.text = favoriteVideoTitleArray[indexPath.row]
       
        
        let favImgUrlString = favoriteVideoImageArray[indexPath.row]
        
        let imageUrl = URL(string: favImgUrlString)
        
        cell.favoriteImage.af_setImage(withURL: imageUrl!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            favoriteVideoImageArray.remove(at: indexPath.row)
            favoriteVideoTitleArray.remove(at: indexPath.row)
            
            deleteVideos()
        
          
            tableView.reloadData()
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//
//        let dvc = mainStoryBoard.instantiateViewController(withIdentifier: "FavoritePlayerViewController") as! FavoritePlayerViewController
//
//
//        dvc.webPlayer = favoriteVideoURLArray[indexPath.row]
//        
//
//
//        self.navigationController?.pushViewController(dvc, animated: true)
//    }

    func updateVideo(){
        favoriteVideoImageArray = []
        favoriteVideoTitleArray = []
        
        let allVideo = realm.objects(VideoFavorite.self)

        for video in allVideo{
            favoriteVideoImageArray.append(video.imageFav)
            favoriteVideoTitleArray.append(video.titleFav)
        //    favoriteVideoTitleArray.append(video.videoURLFav)


            print("Add video \(video.imageFav) of \(video.titleFav)")

            tableView.reloadData()
        }
        

    }
    func deleteVideos(){

        
        let allVideo = realm.objects(VideoFavorite.self)
       
        for video1 in allVideo{

        
            let realm =  try! Realm()
            try! realm.write {

                realm.deleteAll()
                tableView.reloadData()
                
                print ("Delete \(video1)")

            }

        }
    
    }
    
    //handle realm updates
    var token:NotificationToken?
    func subscribeModelChanges(){
        token = try! Realm()
            .objects(VideoFavorite.self)
            .observe{ change in
            self.updateVideo()
        }
    }
    func unSubscribeModelChanges(){
        token?.invalidate()
    }
    
  
}
