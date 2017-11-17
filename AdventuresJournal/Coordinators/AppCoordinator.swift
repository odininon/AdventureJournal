//
//  AppCoordinator.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 11/17/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import Foundation
import Coordinator

class AppCoordinator: NavigationCoordinator, NeedsDependency {
    var dependencies: AppDependency? {
        didSet {
            updateChildCoordinatorDependencies()
            processQueuedMessages()
        }
    }
    
    var characterManager: CharacterManager!
    var adventuresManager: AdventuresManager!
    
    override func start(with completion: @escaping () -> Void = {}) {
        characterManager = CharacterManager()
        adventuresManager = AdventuresManager()
        
        dependencies = AppDependency(characterManager: characterManager, adventuresManager: adventuresManager)
        
        super.start(with: completion)
        setupActiveSection()
    }
    
    enum Section {
        case characters(CharactersCoordinator.Page?)
    }
    var section: Section = .characters(.home)
    
    func showCharacters(_ page: CharactersCoordinator.Page?) {
        let identifier = String(describing: CharactersCoordinator.self)
        if let c = childCoordinators[identifier] as? CharactersCoordinator {
            c.dependencies = dependencies
        
            if let page = page {
                c.display(page: page)
            }
            return
        }
        
        let c = CharactersCoordinator(rootViewController: rootViewController)
        c.dependencies = dependencies
        if let page = page {
            c.page = page
        }
        startChild(coordinator: c)
    }
    
    private func setupActiveSection(_ enforcedSection: Section? = nil) {
        if let enforcedSection = enforcedSection {
            section = enforcedSection
        }
        switch section {
        case .characters(let page):
            showCharacters(page)
        }
    }
}
