//
//  AETableViewController.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 12/2/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import UIKit

open class AETableViewController: UITableViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.backgroundColor = .white
        tableView.separatorColor = .black
        tableView.tableFooterView = UIView()
    }
}
