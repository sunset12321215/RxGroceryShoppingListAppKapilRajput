//
//  ViewController.swift
//  RxGroceryShoppingListAppKapilRajput
//
//  Created by mac on 2/15/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalItem: UILabel!
    
    let listItemdetailsViewModel = ListItemdetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setuptotalLabel()
    }
    
    private func setupTableView() {
        let nibName = UINib(nibName: "FruitTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "FruitTableViewCell")
        tableView.delegate = self
        
        listItemdetailsViewModel.fruitArrayObservable
            .bind(to: tableView.rx.items(cellIdentifier: "FruitTableViewCell", cellType: FruitTableViewCell.self)) {
                _, element, cell in
                cell.configure(fruit: element)
                cell.setupUpDownButton(label: self.totalItem)
            }
            .disposed(by: rx.disposeBag)
    }
    
    private func setuptotalLabel() {
        totalItem.text = "0"
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
