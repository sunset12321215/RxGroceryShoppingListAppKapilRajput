//
//  ListItemdetailsViewModel.swift
//  RxGroceryShoppingListAppKapilRajput
//
//  Created by mac on 2/19/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
import RxSwift

struct ListItemdetailsViewModel {
    let fruitArray = [Fruit(image: "Banana", name: "Banana", cost: 3.50),
                      Fruit(image: "Apple", name: "Apple", cost: 4.00),
                      Fruit(image: "Strawberry", name: "Strawberry", cost: 6.00)]
    var fruitArrayObservable: Observable<[Fruit]> {
        return Observable.just(fruitArray)
    }
}
