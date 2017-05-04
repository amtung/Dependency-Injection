//
//  ViewController.swift
//  DependencyInjection
//
//  Created by Annie Tung on 5/4/17.
//  Copyright © 2017 Annie Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let dataSource: DataSource
    
    init(with dataSource: DataSource & UITableViewDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
        self.tableView.dataSource = dataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewHierarchy()
        setupConstraints()
        dataSource.getData { (success) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setupViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        [tableView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)].forEach {
            $0.isActive = true }
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()}


