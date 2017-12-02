//
//  AventuresCoordinator.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 12/2/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import UIKit

class AventuresCoordinator: Coordinator {
    let navigationController: UINavigationController
    let adventuresViewController: AdventuresViewController
    let character: String
    
    init(of character: String, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.character = character
        adventuresViewController = AdventuresViewController()
    }
    
    func start() {
        adventuresViewController.navigationItem.title = character
        navigationController.show(adventuresViewController, sender: self)
    }
}
