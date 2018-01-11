//
//  FavoriteCollectionViewCell.swift
//  YoutubeClient
//
//  Created by Admin on 10.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import AlamofireImage


class FavoriteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoriteLabel: UILabel!
    
    var favImage = ""
    var titLabel = ""
    
    
    func setup1(item:Item?) {
        favoriteLabel.text = titLabel
        if
            let imageUrl = URL(string: favImage){
            
            favoriteImage.af_setImage(withURL:imageUrl)
        }
        
    }
    
}
