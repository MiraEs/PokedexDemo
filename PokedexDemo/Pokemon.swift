//
//  Pokemon.swift
//  PokedexDemo
//
//  Created by Ilmira Estil on 10/20/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import Foundation

class Pokemon {
    
    let id: Int
    let name: String
    let imageURL: String
    let description: String
    let type: [String]
    
    
    init(id: Int, name: String, imageURL: String, description: String, type: [String]) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.description = description
        self.type = type
    }
    
    convenience init?(withDict: [String:Any]) {
        if let id = withDict["pkdx_id"] as? Int,
            let name = withDict["name"] as? String,
            let imageURL = withDict["image_url"] as? String,
            let description = withDict["description"] as? String,
            let type = withDict["types"] as? [String] {
            self.init(id: id, name: name, imageURL: imageURL, description: description, type: type)
            
        } else {
            return nil
        }
    }
}
