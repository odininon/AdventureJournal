//
//  CharacterCoordinator.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 12/2/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import UIKit

protocol CharacterCoordinatorDelegate: class {
    func showAdventuresViewController(_ character: String)
}

class CharacterCoordinator : Coordinator {
    weak var delegate: CharacterCoordinatorDelegate?
    let navigationController: UINavigationController
    let charactersViewController: CharactersViewController
    let addCharacterViewController: AddCharacterViewController
    
    var characters: [String] = ["Boris"]
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        charactersViewController = CharactersViewController()
        addCharacterViewController = AddCharacterViewController()
    }
    
    func start() {
        showCharactersViewController()
    }
    
    func showCharactersViewController() {
        charactersViewController.delegate = self
        charactersViewController.navigationItem.title = "Characters"
        charactersViewController.characters = characters
        navigationController.show(charactersViewController, sender: self)
    }
    
    func showAddCharacterViewController() {
        let cnvc = CustomNavigationController()
        
        addCharacterViewController.delegate = self
        addCharacterViewController.navigationItem.title = "Add Character"
        
        cnvc.viewControllers = [addCharacterViewController]
        
        navigationController.present(cnvc, animated: true, completion: nil)
    }
}

extension CharacterCoordinator: CharactersViewControllerDelegate {
    func showAddCharacter() {
        showAddCharacterViewController()
    }
    
    func showCharacter(_ character: String) {
        delegate?.showAdventuresViewController(character)
    }
}

extension CharacterCoordinator: AddCharacterViewControllerDelegate {
    func saveCharacter(_ character: String) {
        characters.append(character)
        charactersViewController.characters = characters
    }
    
    
}
