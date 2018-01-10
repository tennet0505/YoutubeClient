//
//  YoutubeCollectionViewController.swift
//  YoutubeClient
//
//  Created by Admin on 09.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import AlamofireImage

private let reuseIdentifier = "cell"

class YoutubeCollectionViewController: UICollectionViewController, UISearchBarDelegate {

    var itemsOfImage = [Item]()
    
    var youtubeService = YoutubeClient()
    
    var searchController = UISearchController()
    var searchText = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        youtubeService.getVideo(q: "dog",
                                
                                successHandler: { VideosResponse in
                                    
                                    self.itemsOfImage = VideosResponse
                                    
                                    self.collectionView?.reloadData()
                                    
        },
                                errorHandler: { Error in
                                    
                                    print(Error)
        }
        )
       self.collectionView?.reloadData()
        
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return itemsOfImage.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! YoutubeCollectionViewCell
    
        cell.setup(item: itemsOfImage[indexPath.row])

    
        return cell
    }
   
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
       
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = mainStoryBoard.instantiateViewController(withIdentifier: "ShowVideoViewController") as! ShowVideoViewController
        
        dvc.urlEmbed = (itemsOfImage[indexPath.row].id1?.videoId)!
        
        self.navigationController?.pushViewController(dvc, animated: true)
  
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchText = searchBar.text!
        self.navigationItem.title = searchText.uppercased()
        
        self.collectionView?.reloadData()
        dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func searchAction(_ sender: Any) {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.text = searchText
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
}
