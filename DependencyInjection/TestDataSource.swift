//
//  RealDataSource.swift
//  DependencyInjection
//
//  Created by Annie Tung on 5/4/17.
//  Copyright © 2017 Annie Tung. All rights reserved.
//

import UIKit

class TestDataSource: NSObject, DataSource, UITableViewDataSource { // dummy test object
    
    internal func getData(callback: @escaping (Bool) -> ()) {
        callback(true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell 
    }
    
}
