//
//  YoutubeCollectionViewCell.swift
//  YoutubeClient
//
//  Created by Admin on 09.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import AlamofireImage

class YoutubeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageVideo: UIImageView!
    
    @IBOutlet weak var labelVideo: UILabel!
    
    
    
    func setup(item:Item?) {
        labelVideo.text = item?.snippet?.title
        if
            let imageUrlString = item?.snippet?.thumbanails?.high?.url,
            let imageUrl = URL(string: imageUrlString){
            imageVideo.af_setImage(withURL:imageUrl)
        }

    }
   
    
}

