//
//  Restaurant.swift
//  restaurant
//
//  Created by Timothy Owens on 6/24/18.
//  Copyright © 2018 Timothy Owens. All rights reserved.
//

import Foundation
import RealmSwift

class Restaurant: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var visited: Bool = false
    @objc dynamic var rating: Float = 0.0
    @objc dynamic var style: Int32 = 0
    @objc dynamic var exp: Int32 = 0
    @objc dynamic var dest: Int32 = 0
    @objc dynamic var diningCost: String = "$"
    
    override static func primaryKey() -> String? {
        return "name"
    }
    
    override static func indexedProperties() -> [String] {
        return ["style", "exp", "dest", "diningCost"]
    }
    
    var destination: Destination {
        get {
            return Destination(rawValue: self.dest)!
        } set {
            self.dest = newValue.rawValue
        }
    }
    
    var foodStyle: FoodStyle {
        get {
            return FoodStyle(rawValue: self.style)!
        } set {
            self.style = newValue.rawValue
        }
    }
    
    var experience: DiningExperience {
        get {
            return DiningExperience(rawValue: self.exp)!
        } set {
            self.exp = newValue.rawValue
        }
    }
    
    var cost: Cost {
        get {
            return Cost(rawValue: self.diningCost)!
        } set {
            self.diningCost = newValue.rawValue
        }
    }
    
    convenience init(n: String, v: Bool, d: Destination, r: Float) {
        self.init()
        name = n
        visited = v
        destination = d
        rating = r
    }
}
