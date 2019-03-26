//
//  MovieDataController.swift
//  DeeperIntoTheJSONAbyss
//
//  Created by Adam Saxton on 3/22/19.
//  Copyright © 2019 Adam Saxton. All rights reserved.
//

import UIKit

class MovieDataController: NSObject {
    
    let JSONURL = "https://api.myjson.com/bins/1e5uji"
    
    var dataModel: Any?
    
    func getRebootData(completion: @escaping (_ dataModel: MovieDataModel) -> ()) {
        
        let jsonURL = URL(string: JSONURL)
        
        let dataTask = URLSession.shared.dataTask(with: jsonURL!) {
            (data, response, error) in
            
            guard let data = data else {
                return
            }
        
            do {
            
                let decoder = JSONDecoder()
                let mediaData = try decoder.decode(MovieDataModel.self, from: data)
            
                self.dataModel = mediaData
            
            } catch let err {
                print("Err", err)
            }
        
            DispatchQueue.main.async {
                completion(self.dataModel as! MovieDataModel)
            }
        }
    dataTask.resume()
    }
}
