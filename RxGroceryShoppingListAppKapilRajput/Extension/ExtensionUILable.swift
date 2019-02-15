//
//  ExtensionUILable.swift
//  RxGroceryShoppingListAppKapilRajput
//
//  Created by mac on 2/19/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

extension UILabel {
    func upCount() -> String {
        let textToNumber = Int(self.text ?? "0") ?? 0
        return String(textToNumber + 1)
    }
    
    func downCount() -> String {
        guard self.text != "0" else {
            return "0"
        }
        
        let textToNumber = Int(self.text ?? "0") ?? 0
        return String(textToNumber - 1)
    }
}
