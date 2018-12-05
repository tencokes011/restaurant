//
//  stuff.swift
//  restaurant
//
//  Created by Samantha Owens on 11/3/18.
//  Copyright © 2018 Timothy Owens. All rights reserved.
//

import UIKit
import Swift_Icons

class SideMenuButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupIcon() {
        self.setIcon(icon: .fontAwesome(.bars), forState: .normal)
    }
}
