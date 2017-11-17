//
//  UIResponder.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 11/17/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import Foundation
import Coordinator

extension UIResponder {
    @objc dynamic func showCharacter(_ character: AECharacter, sender: Any?) {
        coordinatingResponder?.showCharacter(character, sender: sender)
    }
    
    @objc dynamic func showAddCharacter(sender: Any?) {
        coordinatingResponder?.showAddCharacter(sender: sender)
    }
    
    @objc dynamic func showAdventure(_ adventure: AEAdventure, sender: Any?) {
        coordinatingResponder?.showAdventure(adventure, sender: sender)
    }
    
    @objc dynamic func fetchCharacters(sender: Any?, completion: @escaping ([AECharacter], Error?) -> Void) {
        coordinatingResponder?.fetchCharacters(sender: sender, completion: completion)
    }
    
    @objc dynamic func fetchAdventures(for character: AECharacter, sender: Any?, completion: @escaping ([AEAdventure], Error?) -> Void) {
        coordinatingResponder?.fetchAdventures(for: character, sender: sender, completion: completion)
    }
}
