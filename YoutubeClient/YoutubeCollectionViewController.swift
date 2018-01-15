//
//  YoutubeCollectionViewController.swift
//  YoutubeClient
//
//  Created by Admin on 09.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import AlamofireImage
import UIScrollView_InfiniteScroll


private let reuseIdentifier = "cell"

class YoutubeCollectionViewController: UICollectionViewController, UISearchBarDelegate {
   
    @IBOutlet weak var menu: UIBarButtonItem!
    
    var itemsOfImage = [Item]()

    
    var youtubeService = YoutubeClient()
    
    var searchController = UISearchController()
    var searchText = ""
    var nextP = YoutubeClient()
    var nextPageToken = ""
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        youtubeService.getVideo(q: "the best", nextPage: "",
                                
                                successHandler: { VideosResponse in
                                    
                                    self.itemsOfImage = VideosResponse
                                    
                                    self.collectionView?.reloadData()
                                    
        },
                                errorHandler: { Error in
                                    
                                    print(Error)
        }
        )
        self.collectionView?.reloadData()
        
        
        menu.target = self.revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.collectionView?.addInfiniteScroll { (collectionView) in
            
            self.loadMore()
            self.collectionView?.finishInfiniteScroll()
        }
        
    
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
        dvc.titleItemString = (itemsOfImage[indexPath.row].snippet?.title)!
        dvc.imageItemString = (itemsOfImage[indexPath.row].snippet?.thumbanails?.high?.url)!
       

        self.navigationController?.pushViewController(dvc, animated: true)

    }
    
    //MARK Clicked SEARCH Button on keyboard
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchText = searchBar.text!
        self.navigationItem.title = searchText.uppercased()
        
     //   self.collectionView?.reloadData()
       
        youtubeService.getVideo(q: searchText, nextPage: "",
                                
                                successHandler: { VideosResponse in
                                    
                                    
                                    self.itemsOfImage = VideosResponse
                                    
                                    self.collectionView?.reloadData()
                                    
                                    let videoresponse = VideosResponse
                                    
                                    print(videoresponse)
        },
                                errorHandler: { Error in
                                    
                                    print(Error)
        }
        )
        self.collectionView?.reloadData()
        
        dismiss(animated: true, completion: nil)
        
           
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.text = searchText
        self.present(searchController, animated: true, completion: nil)
        
        
    }
    
    func loadMore() {
        
        youtubeService.getVideo(q: searchText, nextPage: "",
                                
                                successHandler: { VideosResponse in
                        
                        //            self.nextPageToken = self.nextP.page
                                    
                                    self.itemsOfImage.append(contentsOf: VideosResponse)

                                    
                                   // self.nextP = "CAoQAA"
                                    
                                    self.collectionView?.reloadData()
                                    print(self.nextPageToken)
        },
                                errorHandler: { Error in
                                    
                                    print(Error)
        })
    
    }
    
}
