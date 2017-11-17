//
//  CharacterManager.swift
//  AdventuresJournal
//
//  Created by Michael Stengel on 11/17/17.
//  Copyright © 2017 Michael Stengel. All rights reserved.
//

import Foundation

final class CharacterManager {
    fileprivate(set) var characters: [AECharacter] = {
        let boris = AECharacter(name: "Boris")
        let pavel = AECharacter(name: "Pavel")
        return [boris, pavel]
    }()
    
    func characters(callback: @escaping ([AECharacter], Error?) -> Void) {
        callback(characters, nil)
    }
}
