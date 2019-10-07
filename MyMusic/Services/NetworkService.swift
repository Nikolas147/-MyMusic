//
//  NetworkService.swift
//  MyMusic
//
//  Created by Aleksey on 07/10/2019.
//  Copyright © 2019 Aleksey. All rights reserved.
//

import UIKit
import Alamofire

class NetworkService {
    
    func fetchTracks(searchText: String, competion: @escaping (SearchResponse?) -> Void) {
        let url = "https://itunes.apple.com/search"
        let parametrs = ["term":"\(searchText)", "limit":"10", "media":"music"]
        Alamofire.request(url, method: .get, parameters: parametrs, encoding: URLEncoding.default, headers: nil).response { (dataResponse) in
            if let error = dataResponse.error {
                print("Error received requestiong data: \(error.localizedDescription)")
                competion(nil)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                print("objects: ", objects)
                competion(objects)
                
            } catch let jsonError{
                print("Failed to decode Json", jsonError)
                competion(nil)
            }
            
        }
    }
    
}
