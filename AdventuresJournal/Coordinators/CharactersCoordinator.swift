//
//  CharactersCoordinator.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 11/17/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import Foundation
import Coordinator

class CharactersCoordinator: NavigationCoordinator, NeedsDependency {
    var dependencies: AppDependency? {
        didSet { updateChildCoordinatorDependencies() }
    }
    
    enum Page {
        case home
        case addCharacter
        case adventures(AECharacter)
    }
    var page: Page = .home
    
    func display(page: Page) {
        rootViewController.parentCoordinator = self
        rootViewController.delegate = self
        
        setupActivePage(page)
    }
    
    func setupActivePage(_ enforcedPage: Page? = nil) {
        let p = enforcedPage ?? page
        page = p
        
        switch p {
        case .home:
            let vc = CharactersViewController()
            vc.navigationItem.title = "Characters"
            root(vc)
        case .adventures(let character):
            let adventuresVC = AdventuresViewController()
            adventuresVC.character = character
            adventuresVC.navigationItem.title = character.name
            show(adventuresVC)
        case .addCharacter:
            let addCharacterVC = AddCharacterViewController()
            let nVC = CustomNavigationController(rootViewController: addCharacterVC)
            show(nVC)
        }
    }
    
    override func start(with completion: @escaping () -> Void = {}) {
        super.start(with: completion)
        
        setupActivePage()
    }
    
    override func showCharacter(_ character: AECharacter, sender: Any?) {
        setupActivePage(.adventures(character))
    }
    
    override func showAddCharacter(sender: Any?) {
        setupActivePage(.addCharacter)
    }
    
    override func fetchCharacters(sender: Any?, completion: @escaping ([AECharacter], Error?) -> Void) {
        guard let manager = dependencies?.characterManager else {
            completion( [], nil )
            return
        }
        manager.characters(callback: completion)
    }
    
    override func fetchAdventures(for character: AECharacter, sender: Any?, completion: @escaping ([AEAdventure], Error?) -> Void) {
        guard let manager = dependencies?.adventuresManager else {
            completion( [], nil )
            return
        }
        manager.adventures(character, callback:completion)
    }
}
