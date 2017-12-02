//
//  AppCoordinator.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 12/2/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get }
    
    func start()
}

class AppCoordinator {
    let navigationController: UINavigationController
    
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showCharacters()
    }
    
    fileprivate func showCharacters() {
        let coord = CharacterCoordinator(navigationController: navigationController)
        coord.delegate = self
        coord.start()
    }
    
    fileprivate func showAdventures(_ character: String) {
        let coord = AventuresCoordinator(of: character, navigationController: navigationController)
        coord.start()
    }
}

extension AppCoordinator: CharacterCoordinatorDelegate {
    func showAdventuresViewController(_ character: String) {
        showAdventures(character)
    }
    
}
