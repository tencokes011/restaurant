//
//  NavigationViewController.swift
//  restaurant
//
//  Created by Samantha Owens on 11/4/18.
//  Copyright © 2018 Timothy Owens. All rights reserved.
//

import Foundation
import UIKit

class NavigationViewController: UIViewController {
    
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    
    enum SideMenuState: Int {
        case IsDisplayed, IsHidden
        
        func isDisplayed() -> Bool {
            return (self == .IsDisplayed) ? true : false
        }
        
        mutating func swapState() {
            switch self {
            case .IsDisplayed: self = .IsHidden
            case .IsHidden: self = .IsDisplayed
            }
        }
    }
    
    var sideMenuState: SideMenuState = .IsHidden
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sideMenuPressed(_ sender: Any) {
        (self.sideMenuState.isDisplayed()) ? hideSideMenu() : showSideMenu()
        self.sideMenuState.swapState()
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func showSideMenu() {
        self.leadingC.constant = 150
        self.trailingC.constant = -150
    }
    
    private func hideSideMenu() {
        self.leadingC.constant = 0
        self.trailingC.constant = 0
    }
}
