//
//  YoutubeClient.swift
//  YoutubeClient
//
//  Created by Admin on 09.01.2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class YoutubeClient{

    
    func getVideo( q: String, nextPage: String,
               
               successHandler :@escaping ([Item])->(),
               errorHandler   :@escaping (Error)->() )  {
    
    let params = ["q" : q,
                  "key" : "AIzaSyDdpSKe16nlex7wx-TT_UdGPq2R4bO3w5k",
                  "part" : "snippet",
                  "maxResults" : 5,
                  "pageToken" : nextPage,
                  "type" : ""] as [String : Any]
    
    
    
    Alamofire.request("https://www.googleapis.com/youtube/v3/search", parameters: params)
        
        .responseObject{
            (response: DataResponse<VideosResponse>) in
            
            switch response.result {
                
            case .success:
                successHandler(response.value?.items ?? [])
                
                print(String(bytes: response.data!, encoding: .utf8)!)
                
            case .failure(let error): errorHandler(error)
            }
    }

    }
}

/*func getImage ( q: String,
 page:Int,
 successHandler :@escaping ([Item])->(),
 errorHandler   :@escaping (Error)->() ) {
 
 let params = ["q"  : q,
 "alt": "json",
 "start": page,
 "searchType": "image",
 "cx" :"009539564186860760717:1yl-cy-7db8",
 "key":"AIzaSyAwFVOEsnqHYOVCw9XpDHc8g9VYlgwJWlI"] as [String : Any]
 
 Alamofire
 .request("https://www.googleapis.com/customsearch/v1", parameters: params)
 .responseObject {
 (response: DataResponse<ImagesResponse>) in
 
 switch response.result {
 
 case .success:
 successHandler(response.value?.items ?? [])
 
 print(String(bytes: response.data!, encoding: .utf8)!)
 
 case .failure(let error):
 errorHandler(error)
 }
 }
 }*/
