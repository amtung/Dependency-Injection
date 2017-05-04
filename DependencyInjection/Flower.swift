//
//  Flower.swift
//  DependencyInjection
//
//  Created by Annie Tung on 5/4/17.
//  Copyright © 2017 Annie Tung. All rights reserved.
//

import Foundation

class Flower {
    let name: String
    let species: String
    init(name: String, species: String) {
        self.name = name
        self.species = species
    }
    convenience init(with dict: [String:Any]) {
        let name = dict["name"] as? String ?? "(no name)"
        let species = dict["species"] as? String ?? "(no species)"
        self.init(name: name, species: species)
    }
    
    static func flowers(from arr:[[String:Any]]) -> [Flower] {
        var flowers:[Flower] = []
        for flowerObj in arr {
            flowers.append(Flower(with: flowerObj))
        }
        return flowers
    }
}
