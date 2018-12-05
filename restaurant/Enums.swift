//
//  Enums.swift
//  restaurant
//
//  Created by Timothy Owens on 6/26/18.
//  Copyright © 2018 Timothy Owens. All rights reserved.
//

import Foundation

enum Destination: Int32 {
    case MagicKingdom, Epcot, AnimalKingdom, HollywoodStudios, DisneySprings, OldKeyWest, Defunct
    
    var description: String {
        switch self {
        case .AnimalKingdom: return "Animal Kingdom"
        case .Defunct: return "Defunct"
        case .DisneySprings: return "Disney Springs"
        case .Epcot: return "Epcot"
        case .HollywoodStudios: return "Hollywood Studios"
        case .MagicKingdom: return "Magic Kingdom"
        case .OldKeyWest: return "Old Key West"
        }
    }
}

enum FoodStyle: Int32 {
    case African, American, Asian, Bakery, British, CajunCreole, Chinese, Cuban, French, German, Indian
    
    var description: String {
        switch self {
        case .African: return "African"
        case .American: return "American"
        case .Asian: return "Asian"
        case .Bakery: return "Bakery"
        case .British: return "British"
        case .CajunCreole: return "Cajun/Creole"
        case .Chinese: return "Chinese"
        case .Cuban: return "Cuban"
        case .French: return "French"
        case .German: return "German"
        case .Indian: return "Indian"
        }
    }
}

enum DiningExperience: Int32 {
    case QuickService, FastCasual, FoodTruck, Reservations, FamilyStyle, CasualDining
    
    var description: String {
        switch self {
        case .QuickService: return "Quick Service"
        case .FastCasual: return "Fast Casual"
        case .FoodTruck: return "Food Truck"
        case .Reservations: return "ResReservations"
        case .FamilyStyle: return "Family Style"
        case .CasualDining: return "Casual Dining"
        }
    }
}

enum Cost: String {
    case Low = "$"
    case Middle = "$$"
    case High = "$$$"
    
    func description(short: Bool) -> String {
        switch self {
        case .Middle: return (short) ? self.rawValue : "$15 to $34.99 per adult"
        case .High: return (short) ? self.rawValue :"$35 to $59.99 per adult"
        case .Low: return (short) ? self.rawValue : "$14.99 and under per adult"
        }
    }
    
    static func cost(c: Float) -> Cost {
        if (c < 15.0) {
            return .Low
        } else if (15.0 <= c && c < 35.0) {
            return .Middle
        } else {
            return .High
        }
    }
}
