//
//  ViewController.swift
//  restaurant
//
//  Created by Timothy Owens on 6/24/18.
//  Copyright © 2018 Timothy Owens. All rights reserved.
//

import UIKit
import RealmSwift

class RestaurantsViewController: UIViewController, RestaurantDelegate {
    
    @IBOutlet weak var restaurantsTableView: UITableView!
    
    let realm = try! Realm()
    var tableDelegate: RestaurantsTableDelegate?
    var selectedRestaurant: Restaurant?
    //    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableDelegate = RestaurantsTableDelegate(restaurants: self.realm.objects(Restaurant.self), delegate: self)
        self.restaurantsTableView.delegate = self.tableDelegate
        self.restaurantsTableView.dataSource = self.tableDelegate
        
        
        //TODO
        //        Setup the Search Controller
        //        searchController.searchResultsUpdater = self
        //        searchController.obscuresBackgroundDuringPresentation = false
        //        searchController.searchBar.placeholder = "Search Restaurants"
        //        navigationItem.searchController = searchController
        //        definesPresentationContext = true
    }
    
    // MARK: - Private instance methods
    
//    func searchBarIsEmpty() -> Bool {
//        // Returns true if the text is empty or nil
//        return searchController.searchBar.text?.isEmpty ?? true
//    }
//

    
    func didSelectRow(restaurant: Restaurant?, cell: UITableViewCell?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "RestaurantViewController") as! RestaurantViewController
        controller.restaurant = restaurant
        self.present(controller, animated: true, completion: nil)
    }
}

protocol RestaurantDelegate {
    func didSelectRow(restaurant: Restaurant?, cell: UITableViewCell?)
}

class RestaurantsTableDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let identifier: String = "restaurantCellIdentifier"
    
    var restaurants: Results<Restaurant>?
    var filteredRestaurants: Results<Restaurant>?
    var delegate: RestaurantDelegate?
    
    init(restaurants: Results<Restaurant>, delegate: RestaurantDelegate) {
        super.init()
        self.restaurants = restaurants
        self.filteredRestaurants = restaurants
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredRestaurants!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let restaurant = self.filteredRestaurants![indexPath.row]
        if (restaurant.visited) {
            cell.textLabel?.textColor = UIColor.gray
        }
        cell.textLabel?.text = restaurant.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let restaurant = self.filteredRestaurants![indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)
        self.delegate?.didSelectRow(restaurant: restaurant, cell: cell)
    }
}

extension RestaurantsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
//        self.filterContentForSearchText(searchController.searchBar.text!)
    }
}
