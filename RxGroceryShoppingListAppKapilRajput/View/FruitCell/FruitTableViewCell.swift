//
//  FruitTableViewCell.swift
//  RxGroceryShoppingListAppKapilRajput
//
//  Created by mac on 2/19/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx

class FruitTableViewCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var buttonDown: UIButton!
    
    private let nameCopy = BehaviorRelay(value: "")
    private var itemCount = BehaviorRelay(value: 0)
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupNumberFruit()
    }
    
    func configure(fruit: Fruit) {
        picture.image = UIImage(named: fruit.image ?? "")
        cost.text = "$ \(fruit.cost ?? 0)"
        nameCopy.accept(fruit.name!)
    }
    
    func setupUpDownButton(label: UILabel) {
        button.rx.tap.asObservable()
            .map({ _ in
                label.upCount()
            })
            .bind(to: label.rx.text)
            .disposed(by: self.rx.disposeBag)
        buttonDown.rx.tap.asObservable()
            .map({ _ in
                label.downCount()
            })
            .bind(to: label.rx.text)
            .disposed(by: self.rx.disposeBag)
    }
    
    private func setupNumberFruit() {
        button.rx.tap.asObservable()
            .map({ _ in
                self.itemCount.value + 1
            })
            .bind(to: itemCount)
            .disposed(by: self.rx.disposeBag)
        
        buttonDown.rx.tap.asObservable()
            .map({ _ in
                self.itemCount.value - 1
            })
            .takeWhile({ (countNumber) -> Bool in
                countNumber >= 0
            })
            .bind(to: itemCount)
            .disposed(by: self.rx.disposeBag)
        
        Observable.combineLatest(nameCopy.asObservable(), itemCount.asObservable()) { (nameResult, itemCountResult) -> String in
            guard itemCountResult != 0 else {
                return nameResult
            }
            return nameResult + " x\(itemCountResult)"
            }
            .bind(to: name.rx.text)
            .disposed(by: rx.disposeBag)
    }
}
