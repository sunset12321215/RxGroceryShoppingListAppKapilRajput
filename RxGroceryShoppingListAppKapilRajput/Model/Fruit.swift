//
//  Fruit.swift
//  RxGroceryShoppingListAppKapilRajput
//
//  Created by mac on 2/15/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import UIKit

struct Fruit {
    var image: String?
    var name: String?
    var cost: Double?
    
    init() {
        self.image = ""
        self.name = ""
        self.cost = 0
    }
    
    init(image: String, name: String, cost: Double) {
        self.image = image
        self.name = name
        self.cost = cost
    }
}

