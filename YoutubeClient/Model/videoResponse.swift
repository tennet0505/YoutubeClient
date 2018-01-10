//
//  videoResponse.swift
//  YoutubeClient
//
//  Created by Admin on 09.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import ObjectMapper

class VideosResponse: Mappable {
    var items:[Item]?
    
    
    required init?(map: Map) { }
    func mapping(map: Map) {
        items <- map["items"]
    }
}


class Item: Mappable {
    var
    id1:Id1?,
    snippet: Snippet?
   

    required init?(map: Map) { }
    func mapping(map: Map) {
        id1 <- map["id"]
        snippet <- map["snippet"]
    }
    
}

    
class Id1 : Mappable {
    var videoId:String?

    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        videoId <- map["videoId"]
    
    }
}


class Snippet : Mappable {
    var title:String?
    var thumbanails:Thumbanails?
    
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        title <- map["title"]
        thumbanails <- map["thumbnails"]
    }
    
}
class Thumbanails : Mappable {
    var high:Url1?
    
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        high <- map["high"]
    }
    
}
class Url1 : Mappable {
    var url:String?
    
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        url <- map["url"]
    }
    
}

