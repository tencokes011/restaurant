//
//  RestaurantViewController.swift
//  restaurant
//
//  Created by Samantha Owens on 11/3/18.
//  Copyright © 2018 Timothy Owens. All rights reserved.
//

import Foundation
import UIKit

class RestaurantViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var visited: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var style: UILabel!
    @IBOutlet weak var experience: UILabel!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var cost: UILabel!

    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        
        self.name.text = self.restaurant!.name
        self.visited.text = (self.restaurant!.visited) ? "Visited" : "Not Visited"
        self.rating.text = "\(self.restaurant!.rating)"
        self.style.text = "\(self.restaurant!.foodStyle)"
        self.experience.text = "\(self.restaurant!.experience)"
        self.destination.text = "\(self.restaurant!.destination)"
        self.cost.text = "\(self.restaurant!.cost)"
        
    }
    @IBAction func dismissPopup(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
