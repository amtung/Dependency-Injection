//
//  RealDataSource.swift
//  DependencyInjection
//
//  Created by Annie Tung on 5/4/17.
//  Copyright © 2017 Annie Tung. All rights reserved.
//

import UIKit

protocol DataSource {
    func getData(callback: @escaping (Bool)->())
}

class RealDataSource: NSObject, DataSource, UITableViewDataSource {
    var flowers = [Flower]()
    
    func getData(callback: @escaping (Bool)->()) {
        APIRequestManager.manager.getData(endPoint: "https://api.fieldbook.com/v1/589f8d2ed501bc040065434e/flowers") { (data) in
            if let validData = data {
                do {
                    if let rootObj = try JSONSerialization.jsonObject(with: validData, options: .allowFragments) as? [[String:Any]] {
                        self.flowers = Flower.flowers(from: rootObj)
                        callback(true)
                    }
                }
                catch  {
                    callback(false)
                    print(error)
                }
            }
            else {
                callback(false)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flowers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "")
        cell.textLabel?.text = flowers[indexPath.row].name
        cell.detailTextLabel?.text = flowers[indexPath.row].species
        return cell
    }
}
