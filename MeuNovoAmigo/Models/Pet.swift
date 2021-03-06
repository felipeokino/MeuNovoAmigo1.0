//
//  Pet.swift
//  MeuNovoAmigo
//
//  Created by Felipe Okino on 12/08/18.
//  Copyright © 2018 Felipe Okino. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class Pet {
    var species: String?
    let description: String?
    var image: String?
    let owner: String?
    var ownerImage: String?
    var ownerCity: String?
    var ownerName:String?
    var ownerPhone:String?
    var id: String?
    
    init(species: String, description: String, owner: String) {
        self.species = species
        self.description = description
        self.owner = owner
    }
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let species = value["specie"] as? String,
            let image = value["image"] as? String,
            let description = value["description"] as? String,
            let owner = value["owner"] as? String else {
                return nil
        }
        self.species = species
        self.description = description
        self.image = image
        self.owner = owner
    }
    init?(dictionary: [String:Any]){
        self.species = dictionary["specie"] as? String
        self.description = dictionary["description"] as? String
        self.image = (dictionary["image"] as? String)
        self.owner = dictionary["owner"] as? String
        self.ownerImage = dictionary["ownerImage"] as? String
        self.ownerName = dictionary["ownerName"] as? String
        self.ownerCity = dictionary["ownerCity"] as? String
        self.ownerPhone = dictionary["ownerPhone"] as? String
        self.id = dictionary["id"] as? String
    }
    func toAnyObject() -> Any {
        return [
            "species": species,
            "description": description,
            "image": image!,
            "owner": owner,
            "flag": "new"
        ]
    }
}
